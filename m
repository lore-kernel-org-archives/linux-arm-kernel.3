Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFF1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 15:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvO5+KUR20pQdJG+G0PbYw3zoxRQx6v+gSRbqhN84x8=; b=neye0KXC6y6FBvwkYN5aBqNYKE
	Qot+6GKkQOExwEHkR0+pXCYlKotVwvcIACKOIKT7ke5MPOXavMVpobQQ1j4n7bfbZQaD6Z53BUkzp
	BBlISQwpzRHNlYrGrYL9G7fbFFT/RXnC8Vk6+RmOvnEzfQ+w2TsGyFe+ek/UzpO1wBiIWyIyEfzYG
	oldFDH7e8f0rAIT2TFZEy9dDc2cYcvLmu2MXP/6RMXikMGaGXHNaHeao5CiYN8sru6+PLVVlPP5GH
	XDzWQnVnHdpOXcniSDXZQPyKh+h/W5KFIZbh+K2SD/X9UAYTff/gHzM4t6s0/T/ljj70uxIquKftc
	M6u7X2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNIL-0000000AjBk-1Izh;
	Thu, 02 Jan 2025 15:39:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNGX-0000000AijD-03tv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 15:37:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5016F11FB;
	Thu,  2 Jan 2025 07:38:08 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 16C5A3F59E;
	Thu,  2 Jan 2025 07:37:37 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	johan+linaro@kernel.org
Subject: Re: [PATCH 0/3] Add SCMI Vendor module autoload support
Date: Thu,  2 Jan 2025 15:37:30 +0000
Message-Id: <173583220044.2167015.12505379511834560492.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209164957.1801886-1-cristian.marussi@arm.com>
References: <20241209164957.1801886-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_073741_120904_8083FA3B 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, 09 Dec 2024 16:49:54 +0000, Cristian Marussi wrote:
> a tiny series to add the capability to automatically load the proper
> vendor protocol module when an SCMI driver tries to use it; while proper
> vendor protocol selection is already provided by the SCMI core, automatic
> loading of vendor protocols was not.
>
> Lookup is now based on module aliases following the pattern:
>
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/3] firmware: arm_scmi: Support vendor protocol modules autoloading
      https://git.kernel.org/sudeep.holla/c/54cf6e786caa
[2/3] firmware: arm_scmi: Add module aliases to i.MX vendor protocols
      https://git.kernel.org/sudeep.holla/c/d4cc8912cbff
[3/3] firmware: arm_scmi: Add aliases to transport modules
      https://git.kernel.org/sudeep.holla/c/3f3f0e53e9ae
--
Regards,
Sudeep


