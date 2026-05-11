Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62AECD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8Xetm6pXlmWaF8BYDcHRh9PwuA/ZHEU7ydcu5tFpj4=; b=s9Mucmru1A0Pg9F0nShlGjX6bi
	LMtbGX++0l2Bj64+0Jcp3ck8z+ZOPawzEcYFfvaQErWCZSWFobO2x3S3HzGbAaKhU9cR6DKM37I3R
	PXZxd3SRrypTC8A+OaeHS+nhngMpvyNPvN7LDg2/RzKy72IDB2Vxz515WRC92nmRjaE+VpjtWBuoO
	BvMi0OSFCVaGoEkro5UWcaFEqe7slbZePH1ru3RaSotuMTozVbgxjs6uy7UMw65GVTCt83+/9e9po
	CpraDhOTclumFZJ4c2T3V4cOwU0q3wlbMX9SFnjN1GRwJt1LTeVLaz3D2Tc3QTaCx6/24axiJhV/y
	C0uLGdzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN4U-0000000CxFC-41nV;
	Mon, 11 May 2026 09:37:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN4L-0000000Cx6t-1f8f;
	Mon, 11 May 2026 09:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=M8Xetm6pXlmWaF8BYDcHRh9PwuA/ZHEU7ydcu5tFpj4=; b=o38jcWXxgrq5MsPoJaRSW8IWHX
	jZRB5goxpHOsR/AMXXUw+OUqFV+lnyB5mv9AyCB9x3EIum31MSK258ssn/MROnrK09sVsANhgUiFy
	bdD68dkQOQqXQVWbv4OESqdzsXxmc/QWo1xr6/HSLcwkVI+oilgjrGX17Ss16kpdfgQpRY421grBW
	Prge36BEoHy+h7UZR8fwHFV8qjVpIcWw7cfUId53ckdKmKa/sqkMuTphNzg4pIYVylQFOnDCeq8k+
	1dHySFvfSvsyhhA65Ozr+fAo+YTJ/MmwOqy1sRc78eowtj15uKplWjijOAgSNrmnLgqxBKiql+AkC
	X1nqfXNg==;
Received: from [148.251.105.195] (helo=bali.collaboradmins.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN4H-0000000BD3w-2MIk;
	Mon, 11 May 2026 09:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492199;
	bh=V1y7tjJRuCwDowtB2VyufXxqZxGF/rpZo3KydJpUpfg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=CGvvF2q2URlG3ZF8o94swnNzy+vEJqrQkbHVMJrjnIWXknm2rj2ousoDavxeAaktu
	 y2sHOxvxa31EGzhWarHla+VYN6etpQusLtjBOyXQt8iJ8/eoP0BFmoQyip9UHcJ1KH
	 2vuoaZtQG1+kXHBnnpQPqYr5GEFxumh9/Ru7w5a/KL+R+il7Ra3nN6loC97CrDuK78
	 mvFxYPxAkqm2Rc8N7EocxU5C2rpNTrIsrZoWOj2HUUBjtxdcE06lEAu2oW0j2iLe+T
	 Zo6c7x3Dv4VBXrlAeFu+hzqTtG7FlEK19b10mn8kzsNKE+H2z/kRCcGf36P2nH6TJ1
	 zwWUEKzXU0g8g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C33E617E13D3;
	Mon, 11 May 2026 11:36:38 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20260428224755.336843-1-olek2@wp.pl>
References: <20260428224755.336843-1-olek2@wp.pl>
Subject: Re: [PATCH v3] arm64: dts: mediatek: add crypto offload support on
 MT7981
Message-Id: <177849219874.115964.16505736751256463138.b4-ty@collabora.com>
Date: Mon, 11 May 2026 11:36:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_103654_392438_7D15E999 
X-CRM114-Status: UNSURE (   5.79  )
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

On Wed, 29 Apr 2026 00:47:43 +0200, Aleksander Jan Bajkowski wrote:
> The MT7981 as well as the MT7986 have a built-in EIP-97 rev 2.3p0 crypto
> accelerator. This commit adds the missing entry in the dts.
> 
> 

Applied to v7.1-next/dts64, thanks!

[1/1] arm64: dts: mediatek: add crypto offload support on MT7981
      commit: bd25a2e3b0768b1526a8120790453a5880f11ede

Cheers,
Angelo



