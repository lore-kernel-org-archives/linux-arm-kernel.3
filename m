Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED050C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 20:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKTmjq3H4VMXyq2Ze+g4Juc18m6aYpGE5eXI0bSO8i8=; b=iQCcap4UVP7Alyb9n2/U8Mbh4E
	/H4luFhwi26TLWNAT+EDKW1nMJGl1C7M+BTRAYyYkKXQaGKmW5IxgVFUzvom+30XoP86q0O0cAcVN
	caH/GkP4hAp/TRLh+2A5+pIx9YgeOWfZ7CwOfd2HaJIffxMJg1PiCkPtcPHYYEuDTBTHzqryoz1XE
	hvKvHqQGnCxnP0Uuxy6bgUlotghfMf9jQvdKyHYdCYvquaqeNCU7apAi/MflwLTa/quUJH9feJ7hh
	VhZk2tSSoxyMtZMuIDMji5s3eKao1/z5hnZj5afT9naaFz4Rp717xHRYFcIO7Se6cTV05Biq2O3dN
	iPmOZZpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkT3Z-00000000XAR-3A0t;
	Thu, 16 Jul 2026 20:51:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkT3Y-00000000XAH-07NG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 20:51:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 13D0B60A5E;
	Thu, 16 Jul 2026 20:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEBA1F000E9;
	Thu, 16 Jul 2026 20:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784235102;
	bh=tKTmjq3H4VMXyq2Ze+g4Juc18m6aYpGE5eXI0bSO8i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oqs9Gz67/s7htGodt5u8Z9lEFvvMAi5ZX7VgIyoO1Vu3OJ+v6yqTrAfxWc+k4jC9m
	 r9IX/drzboIlWrWcUplukDRwshRYwUfRoUEfHWdDtVTQEASdTiooZ3Gs4q3RIkdXs5
	 eK1F81/EPQSHxWZbf5enSPflg5QBFJDco74AKDobNAqR11B1tU8l+xYTGN8jpJiTGM
	 x+lZAWmzn5r3tp45WXQF2o66SOUICJ5duvDEn8dlXSvy+VYpPAVvAIowE67w0a+3Mq
	 RSYSOjeZYckWNKRPA1EU3g3Ok8Z0XMdOphnDfnZYIJ7RXTodH/8Rm++ay88aE2LnWU
	 Sld+GzpswbuHw==
Date: Thu, 16 Jul 2026 15:51:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: arm: Add Live Firmware Activation
Message-ID: <178423510160.1271124.8998579223606247136.robh@kernel.org>
References: <20260706134455.132091-1-andre.przywara@arm.com>
 <20260706134455.132091-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706134455.132091-2-andre.przywara@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Salman Nabi <salman.nabi@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, vsethi@nvidia.com, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Mon, 06 Jul 2026 15:44:41 +0200, Andre Przywara wrote:
> The Arm Live Firmware Activation spec [1] describes updating firmware
> images during runtime, without requiring a reboot. Update images might
> be deployed out-of-band, for instance via a BMC, in this case the OS
> needs to be notified about the availability of a new image.
> 
> Describe an interrupt that could be triggered by the platform, to notify
> about any changes.
> 
> [1] https://developer.arm.com/documentation/den0147/latest/
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/arm/arm,lfa.yaml      | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


