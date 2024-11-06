Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0F1D29FA8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 07:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtMjA3nRluk5JfTzcXPOpwMyIw2jC9zBNjVcIw8wN7w=; b=cIKWFS/7gb25n25hCp7kDvq50C
	Pkheg0IMYRMWMtH3v/YHGBIdsMc54lpvLCxKtI41U/mv9J5ODUUrpjWbSiLbW9IjG0HnouCi6gvKN
	IyBIkfDxrnlPOuSj1HU05iu9iqZcdj0T0BKaWuYjOeJhScNsnJ7E8255NBSlJW5lrQ4vTI/5svVlq
	bmfFKRiqWwkhVyd8A5sWkI2HPSMG/g9KAz+UC7T5g3P/yOTRsWIgxfm0cnegjx5Horr1p0cE5U79z
	oAETQdymbnIVGoh9poHd2mKx7hsVZjOsyCm/3dBrsRbtYYn828kliVTREAVuwIJ0KNSzx6uXw7XxC
	MXNfT69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aSn-0000000270X-05yi;
	Wed, 06 Nov 2024 07:28:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aQt-000000026jL-2aLI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 07:26:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD9681063;
	Tue,  5 Nov 2024 23:26:56 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D06E83F66E;
	Tue,  5 Nov 2024 23:26:24 -0800 (PST)
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
	quic_nkela@quicinc.com,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v3 0/7] Expose SCMI Transport properties
Date: Wed,  6 Nov 2024 07:26:21 +0000
Message-Id: <173087788054.3975719.458271006715771508.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028120151.1301177-1-cristian.marussi@arm.com>
References: <20241028120151.1301177-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_232627_717681_670C85F4 
X-CRM114-Status: UNSURE (   8.85  )
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

On Mon, 28 Oct 2024 12:01:44 +0000, Cristian Marussi wrote:
> SCMI transports are characterized by a number of properties: the values
> assumed by some of them tightly depend on the choices taken at design
> time and on the overall archiecture of the specific platform: things like
> timeouts, maximum message size and number of in-flight messages are closely
> tied to the architecture of the platform like number of SCMI agents on the
> system, physical memory available to the SCMI server...so on and so forth.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/7] firmware: arm_scmi: Account for SHMEM memory overhead
      https://git.kernel.org/sudeep.holla/c/5c14f38893d0
[2/7] firmware: arm_scmi: Calculate virtio PDU max size dynamically
      https://git.kernel.org/sudeep.holla/c/3229e33311f8
[3/7] dt-bindings: firmware: arm,scmi: Introduce more transport properties
      https://git.kernel.org/sudeep.holla/c/5654d37268bc
[4/7] firmware: arm_scmi: Use max_msg and max_msg_size devicetree properties
      https://git.kernel.org/sudeep.holla/c/c091de2d383a
[5/7] firmware: arm_scmi: Relocate atomic_threshold to scmi_desc
      https://git.kernel.org/sudeep.holla/c/112ffc78dc8f

(The below 2 were applied as fixes and sent for v6.12, sorry I missed
to send confirmation earlier)

[6/7] dt-bindings: firmware: arm,scmi: Add missing vendor string
      https://git.kernel.org/sudeep.holla/c/7bf46ec090b9
[7/7] firmware: arm_scmi: Use vendor string in max-rx-timeout-ms
      https://git.kernel.org/sudeep.holla/c/54962707f8b8

--
Regards,
Sudeep


