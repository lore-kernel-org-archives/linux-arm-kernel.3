Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3B2C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Il75rMT0w7WTkKxYVfwvba2fwzPLmWHPL1i8BZIxLOA=; b=Vu0JW8mG8qHR60vx0ez6mXiiSt
	t7XvAYyHsk4CGqI11BurgdPtEXW8gOaqXu19TAAAr5f2KfMHkuDba4i+d6nZNa/rXC7QDtN26kf5L
	2lMXWLcu88V+kgZ0Lfr0cG23sxQHIeZmwzwTQ69a10VCfRmxYsmH4JcBEGgb/s4YHZXIvafKwf6QI
	sBVhtsE4Us+RkNzyXEv+sgkHLygdzDXVI2W0fgyPPGC7/AKEL0Imnhv7URI6II+2YaF/hdDpShO8+
	VARM5ZoLFmyrfif0yAVjdUyFY/E3n5Icq3B5To1L+nY+ByqJp4zVRcFJEY6zNsR+Lj7YF+YJwr7ki
	70yRZxzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taE1F-00000007wus-1ET4;
	Tue, 21 Jan 2025 13:10:13 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taDzw-00000007wgG-3pzg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 13:08:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EE2040009;
	Tue, 21 Jan 2025 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737464928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Il75rMT0w7WTkKxYVfwvba2fwzPLmWHPL1i8BZIxLOA=;
	b=SMDboO55VeXLOhdnmLSX/T4/NgRLenuWdo3wC8VmF3yKhXnBb+H2k3FDKDDlCipf0foJqm
	NIPGdoTw4bCIE6Z+QjEPlKxN425MXs2+bmuVSKZNbrDTOPenmuF1xqoeK/MzlhYLwf2nGE
	MYdz978SMSg1YpvyiN1wPsUQNIIO7iWsD3ZDlYTuH1g7q/aJHj7Cjf2c9ijkYDjKPfxFia
	8dLDqtKxcTG8ca0X6G119mu6LVR6HBYCpS4izqstRRMZ8PhATz+hzx2AEGiwvTnbtmW7Jy
	/vNYZE32/MRATqTpKs03Aj6eA/r/woYAnM17C+fsBFGLjsgH/KAG4ZhM82joMA==
Date: Tue, 21 Jan 2025 14:08:40 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Richard Cochran
 <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: net: ethernet-controller: Correct
 the definition of phy-mode
Message-ID: <20250121140840.18f85323@device-291.home>
In-Reply-To: <20250121-dts_qcs615-v3-1-fa4496950d8a@quicinc.com>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
	<20250121-dts_qcs615-v3-1-fa4496950d8a@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_050853_090420_8A5FEF51 
X-CRM114-Status: UNSURE (   8.60  )
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

On Tue, 21 Jan 2025 15:54:53 +0800
Yijie Yang <quic_yijiyang@quicinc.com> wrote:

> Correct the definition of 'phy-mode' to reflect that RX and TX delays are
> added by the board, not the MAC, to prevent confusion and ensure accurate
> documentation.

That's not entirely correct though. The purpose of the RGMII variants
(TXID, RXID, ID) are mostly to know whether or not the PHY must add
internal delays. That would be when the MAC can't AND there's no PCB
delay traces. Some MAC can insert delays.

There's documentation here as well on that point :

https://elixir.bootlin.com/linux/v6.13-rc3/source/Documentation/networking/phy.rst#L82

So, MACs may insert delays. A modification for the doc, if needed,
would rather be :

-      # RX and TX delays are added by the MAC when required
+      # RX and TX delays are added by the MAC or PCB traces when required

Thanks,

Maxime

