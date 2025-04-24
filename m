Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59C6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+3htQ+oDi+9ack5B/83y2c7phUqaLK4hm63OzTT48w=; b=Q042OY+3pCqX3/TQ46fNhVO8nv
	xTdDlYxOwGQgsEQxuyqaQDvrP4Ctf2HixcyFOvtBjlYE9YfnSlTpwXfmW8rC5P9zfsn5dNp9rMk7h
	4BIEkbvnZExtmPvEV19A8xpITyQczj2sqxoGrSTewW0tn2+C/oSN2DTopSZI/i7DScNhDea4TxHUb
	L+jAfhRUvNOZbVgwe8+qt1cSUCgq5QTQ+WoON17L/27uedceM3wlks3eZMVBxSPiUrfrpZxpCFeRP
	Orp5kmqKr628+keVpzKqYOzrYazpaWTtIP6GWnIGJwN7poZfPbcB+QkZhRTYCTFH488EAZXAR6Qaa
	ZyyAT0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7u36-0000000Dj90-1Kqq;
	Thu, 24 Apr 2025 10:43:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t6t-0000000DYBj-1lO8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 09:43:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E0FC1063;
	Thu, 24 Apr 2025 02:43:06 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4FE193F66E;
	Thu, 24 Apr 2025 02:43:08 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 0/7] firmware: scmi/imx: Add i.MX95 LMM/CPU Protocol
Date: Thu, 24 Apr 2025 10:43:01 +0100
Message-Id: <174548766597.774610.5988184547101192085.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_024311_504168_47E5436E 
X-CRM114-Status: UNSURE (   7.41  )
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

On Tue, 08 Apr 2025 16:44:24 +0800, Peng Fan (OSS) wrote:
> i.MX95 System Manager(SM) implements Logical Machine Management(LMM) and
> CPU protocol to manage Logical Machine(LM) and CPUs(eg, M7).
>
> To manage M7 in a separate LM or in same LM as Linux itself. LMM APIs
> and CPU APIs are needed.
>
> When M7 is in LM 'lm-m7', and this LM is managable by 'linux-lm',
> linux could use LMM_BOOT, LMM_SHUTDOWN and etc to manage 'lm-m7'.
>
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/7] firmware: arm_scmi: imx: Add LMM and CPU documentation
      https://git.kernel.org/sudeep.holla/c/15ec0e776935
[2/7] dt-bindings: firmware: Add i.MX95 SCMI LMM and CPU protocol
      https://git.kernel.org/sudeep.holla/c/73b7a51b7445
[3/7] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
      https://git.kernel.org/sudeep.holla/c/34180863e000
[4/7] firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
      https://git.kernel.org/sudeep.holla/c/e68c305bc2f3
[5/7] firmware: imx: Add i.MX95 SCMI LMM driver
      https://git.kernel.org/sudeep.holla/c/7242bbf418f0
[6/7] firmware: imx: Add i.MX95 SCMI CPU driver
      https://git.kernel.org/sudeep.holla/c/1055faa5d660
[7/7] MAINTAINERS: add entry for i.MX SCMI extensions
      https://git.kernel.org/sudeep.holla/c/b0a1c9d4893a
--
Regards,
Sudeep


