Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BBEC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 13:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lo0m91Rehd6bgZG0QLkCun4bgSY/wiPJXWGmO2i2Vw0=; b=OHrDVc3YpsRs2EDaqHUYBQiXIr
	u7H9X3DsNKXp+pGxK61ZgeGuGByTeUaVTW4pkJfHOpDxvpExUQpNDxMtfyzBUNbNZ5Cd98JkQN3nn
	25Tx0uBquiZ3p/53QhvKdbCqNDj7Zb3Pb0WpF6v40g5KAYJ0rFLrh2ercipZRfwg71fmnljv0bnWi
	5cf/ylvs1MB2grt/E/Wd2IL2kRJmyPBeBOEKx5n3cz/+WYCLhvbvi86pM8bg3ASRQjPyByO89uF4S
	Tvu4e7LJE+6u/7jmFt6q3k3a3IAwVJl5kXDO1cAXRhoTCDCBXb8LmdgMMg9VnAJ/K4wkA/4etcEdk
	5vl7oqLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESmE-00000009TLf-1Nf0;
	Mon, 12 May 2025 13:01:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESSK-00000009Pf2-1kwj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lo0m91Rehd6bgZG0QLkCun4bgSY/wiPJXWGmO2i2Vw0=; b=dMHF7P12CyWbyi6Lt2DBaFT42h
	UltO+mXfugcoI/aNx0B9AUqY/vj281F7eA0tuVbbxFob3Mxi1rAgv4eFf9QwBOVxAqZGQmn8Ebx+k
	eUpy8a5Lm55lvr5ENppTsMzEEhQz3pz9bMaep8BP/CSOWJojFgmdixn2M4Vh7GgaYRQg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uESS4-00CKp0-VS; Mon, 12 May 2025 14:40:12 +0200
Date: Mon, 12 May 2025 14:40:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: leo.jt.wang@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com, leo.jt.wang@fii-foxconn.com
Subject: Re: [ARM: dts: aspeed: clemente: add Meta Clemente BMC] ARM: dts:
 aspeed: clemente: add Meta Clemente BMC
Message-ID: <224aec6e-6dab-4634-a7a0-220616f455de@lunn.ch>
References: <6821dbe7.170a0220.3b15e.ab77@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6821dbe7.170a0220.3b15e.ab77@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_054028_466494_EBE91FA0 
X-CRM114-Status: UNSURE (   5.60  )
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

> +&mac0 {
> +	status = "disabled";
> +	/* phy-mode = "rgmii-rxid"; */

This is very likely to be wrong. Please see:

https://patchwork.kernel.org/project/netdevbpf/patch/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/

	Andrew

