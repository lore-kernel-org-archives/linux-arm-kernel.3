Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A98EC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 23:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2ZTkpUJeXP3YlXl7No/41qQLjvNAIvVjUVPINNflsI=; b=POwBVpSJ0KMfu46ltCELkK/y19
	wkj/dspKO6TBWotVM+b8yJ6w0++m7MQvgzrGRuNk+R7NARrI5G29Kk5ARUeqIWWo1GRon9PHYLVkz
	biM/sy7H3oPeI9DmF3bp+ndMIjUE+sn8lXj4fGruTZw6LeaAxSuRR4cmntDZ5YD3P3cqWiF+zNO6b
	fcHcaE+Xvl2qzbMTpnrI96Mc9Kbp1c3DPm1C3scTWdHRFek657g84WJ8mD60j6Tn5cFZ9mL2DGB10
	Oww0jtYiCEMIzpSuywJWDdD7g7bs9d/XiG6pXDzllTbYI3XHdYCBKts/BdY6c1sbMIUfWiXz7AJBF
	3K62959Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUx6-000000045hQ-1QB5;
	Mon, 27 Jul 2026 23:41:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUx5-000000045hG-1tAD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 23:41:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA9BE42A01;
	Mon, 27 Jul 2026 23:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054601F00A3A;
	Mon, 27 Jul 2026 23:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785195702;
	bh=X2ZTkpUJeXP3YlXl7No/41qQLjvNAIvVjUVPINNflsI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=PPJVrHMqNES0sq6q2+DyQSmwNyJdZ50Wr7yAtRGtvNhQEuoatMLw4j2wAH+nXbUiH
	 8pJAQ5kT/F3t7lzVA6tiJgDVGiuvTDijX/IaW83P3HQBmG7W7xDj8Tlj2EenA7qPlD
	 gNHTUMNPBEA21ewIcOhEawb5CVYXkC5AFH61MFqlK33Rxw3iQZQDmDiAinFJf7doSr
	 U09ZeWaMWPRydWAECOLCyIClWNEokZU3Iwy6sgMBZpsEQF8+7RuY8UcYTX7EM+OHtt
	 vTmv8XhYF+/fJ/mbEd3cxbBgqsL04Buv3YYXz+uKCmOcAgqcySUjrksDJWNfRALh31
	 9HN1mXoL59X2g==
Date: Tue, 28 Jul 2026 00:41:36 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, sudeep.holla@kernel.org,
 james.quinlan@broadcom.com, f.fainelli@gmail.com,
 vincent.guittot@linaro.org, etienne.carriere@st.com, peng.fan@oss.nxp.com,
 michal.simek@amd.com, d-gole@ti.com, elif.topuz@arm.com,
 lukasz.luba@arm.com, philip.radford@arm.com, brauner@kernel.org,
 souvik.chakravarty@arm.com, david@kernel.org,
 subrahmanya.lingappa@oss.qualcomm.com, leitao@kernel.org, kas@kernel.org,
 puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v6 01/22] firmware: arm_scmi: Add new SCMIv4.0 error
 codes definitions
Message-ID: <20260728004136.3e83b36c@jic23-huawei>
In-Reply-To: <20260724144430.1440170-2-cristian.marussi@arm.com>
References: <20260724144430.1440170-1-cristian.marussi@arm.com>
	<20260724144430.1440170-2-cristian.marussi@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 24 Jul 2026 15:44:09 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> SCMIv4.0 introduces a couple of new possible protocol error codes: add
> the needed definitions and mappings to Linux error values.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
FWIW matches the spec and the mapping to Linux error codes seems
sensible to me.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

