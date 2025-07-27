Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F28C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ea/LVnrickzrKsQYDVPNFYq4HqocG3+kI8GD60vgLes=; b=pA4OMWQMyBN4t8oKhLP8VF3uj8
	MhHMwVx85SfQqVApeR4sIspM5PQCIwZwNBSxhutWWnQIWDbOzdF1R2aTVrNyd3V/JBYpE/Dqyfi++
	GMCkI+8E155WNS4jYEyPGRJ/zbaclXFuMsoyVM7+iJEy9YVPpSphrPcgNyImrdrC0EpTC/k1k1U7n
	hBuJk0xKGUi31OtaOFEmPPVWTdhmYxbverUudjcMqaNxDZBnaQiKj/KsBawuWYZUUY889Gt7PlnMx
	Oe0Gc63p0jxbNsb/VNNqTDwCs/wunT5JwvMuGCP7pi/tu/HT+K+j+EwVYQpEt1avU+BUS9vMiG+3+
	/N99eU9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug3cP-0000000CsZ9-3nzv;
	Sun, 27 Jul 2025 15:48:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug3Zj-0000000CsNl-3smv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 15:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ea/LVnrickzrKsQYDVPNFYq4HqocG3+kI8GD60vgLes=; b=QBVi0/B33ltuEPuvItV2c342JE
	VhGgUB8pE0M8DhPFgtpP/R0NyKeM5ckeok09OTTsnJ7nKRsFaN2LxdVWS4bu1Ir1Ma8YWCLfb7W68
	XwcuvozrF4T6aKh7FDl7mf5oXsKSz7RSs/QC+PGWcqvrdgFZpND3OkPMsKx9aJURUxpY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ug3ZP-0030lE-Nq; Sun, 27 Jul 2025 17:45:51 +0200
Date: Sun, 27 Jul 2025 17:45:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tao Ren <rentao.bupt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v3 10/13] ARM: dts: aspeed: Add Facebook Fuji-data64
 (AST2600) Board
Message-ID: <9897e0a4-7c70-4e27-8591-09e9d6ef2263@lunn.ch>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
 <20250723233013.142337-11-rentao.bupt@gmail.com>
 <d09667e5-992e-4ced-ae30-7a4116a72c62@lunn.ch>
 <aIGGdbIX9HaV4dB/@localhost.localdomain>
 <769d6817-ee97-4a23-b013-29bc875a00cb@lunn.ch>
 <aIMTvUyHGd/ikKY9@localhost.localdomain>
 <aIW/xEfJX/UD1kje@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIW/xEfJX/UD1kje@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_084611_962581_40FD21F6 
X-CRM114-Status: UNSURE (   8.49  )
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

> As I'm not 100% sure where the RX clock delay is introduced, I will drop
> mac3 entry in v4.

Many of the hyperscalers, or the supplies to the hyperscalers keep
hitting this. The standard policy at the moment seems to be to drop
Ethernet support. How useful is a BMC without Ethernet?

If you all got together and talked to aspeed, apply a bit of pressure,
it should be possible to get this mess fixed pretty quickly. And then
you could all have working Ethernet....

	Andrew

