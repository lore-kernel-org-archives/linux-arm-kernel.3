Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF706C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/qx3gACLobp/kVaCWxWU6urjoLYTDk1lm6knmcF17E=; b=qEX9JakJdWbYGo2/MOqXBKNzfD
	fC7aC3WcMc4R9SAI/oXs2ZWiN6RaOtGyqUDzv6Wo8IiugZ7KamlmJHaJFQz8uEa6Ti51FfPj0cBmM
	KqJxIWTSpqzHJ4C2TkY9VKaCGoKgz4NlmnEr0mbCGcNecnFeoekAA10nZDv2H3DQl0cyqDdZGhE07
	rQr/kUQipab13Ya1kpqbudixciTNtxfoY5Bnm2DQ4InTnftd6gfpqd+bBK8OmSWSV7CDOo95LfLVu
	Phoi8H7YTutu67ZBIAcVn/y51FyVmjuiicYVyvrkBOhpRkxKBEFdPt1c9DZGXc17895z3/4G8pKne
	BK2ZRgTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Kd5-0000000CfDA-2JpA;
	Thu, 17 Sep 2026 22:30:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Kd4-0000000CfCG-15eQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:30:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9FEA402B6;
	Thu, 17 Sep 2026 22:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC811F000FF;
	Thu, 17 Sep 2026 22:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789684253;
	bh=4/qx3gACLobp/kVaCWxWU6urjoLYTDk1lm6knmcF17E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OLPLzJkL2pS51ZSdjvIK3zdS7esWlyTgsGn50j02Y2ZED9OxLGUZj7V58u32BmEVK
	 mX85kSqvR/CetXKufKiQsPtO5BR1RnM3JufEsmwuZFSQ2JISfXRFnHaqZhMILoYcBT
	 Bvd5PDr8DhkgvFvdihoRBfnNnxj3vscpeS3yKXdIXLuxYh1VEMXTEJM5MD30ZrehVZ
	 zNULAC0juzOT3fAL3u3cbRGdHpCTaOdwUye3he5MwrRa1ZyY14KJZtNhvcXcwHjjq/
	 ek+uXsramaiYLMPIhp70TYdNX/cb5Vfj9+a5zJU2Se9X5x4PhfMRaRd/IKAA6FCgyQ
	 rtAnBRZI1P99w==
Date: Thu, 17 Sep 2026 17:30:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Philipp Zabel <p.zabel@pengutronix.de>,
	Neal Gompa <neal@gompa.dev>, Konrad Dybcio <konradybcio@kernel.org>,
	devicetree@vger.kernel.org, Joshua Peisach <jpeisach@ubuntu.com>,
	asahi@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2 05/22] dt-bindings: thunderbolt: Add Apple
 USB4/Thunderbolt NHI
Message-ID: <178968425120.4102150.11013505530489451162.robh@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-5-1f80085f93fb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-5-1f80085f93fb@kernel.org>
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


On Sun, 06 Sep 2026 20:36:28 +0200, Sven Peter wrote:
> The Native Host Interface (NHI) provides the TX and RX rings used by the
> software connection manager on Apple Silicon SoCs.
> 
> The NHI is part of the ACIO host router and is exposed to the main SoC
> bus while the ACIO co-processor is running.
> 
> T6000 and T6020 use one DART stream for the TX and RX control rings and
> one shared by all other rings, which are used for XDomain connections.
> This likely improves the isolation of those host-to-host connections.
> 
> The M3 generation uses a slightly insane set of 24 IOMMU entries. These
> are probably one DART stream for each TX and RX ring.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> ---
>  .../bindings/thunderbolt/apple,t8103-usb4-nhi.yaml | 151 +++++++++++++++++++++
>  MAINTAINERS                                        |   2 +
>  2 files changed, 153 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


