Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A7BCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 12:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W90OhjYoHyhhzA+BV0JTzFuzDM246+EyNiR3TbYO7Hc=; b=OdJeiTCm9WR82b6wWyJuQMmusn
	HKG53aX9XwhzPUyTDkVRl1sDJxBfogvjHF/EZGd8mY9tB0VUjoy6atZrZs5eUMTII+Id+j+emqqwM
	juVOcBuTqdZc/HhNgpTgC1fYBBTB8g4XP487Xt/DC4ZJuOO1gYpvyBOtzBB6EIFiAqi35XqCtTsB8
	Co5Or5kLMvuI/sATQlJePKnt72JeTCt13kFkUqx+VVjM8i9f7MXjeHgxFxpio/0w62RjtVQIRg1Bt
	cXXasLaw/oZ1QFexwyPQC4Tg9Y7fqkq2frnMZMEZDxswb8JuvMr9FOBK2JxMcV7W9BUIF0zs/3YIW
	PTulbl5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HRp-0000000D6B8-2rE0;
	Mon, 13 Oct 2025 12:14:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HRo-0000000D6Af-1Ajg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 12:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=W90OhjYoHyhhzA+BV0JTzFuzDM246+EyNiR3TbYO7Hc=; b=ospcB8Q8QJcC36IuI02UtjG+n8
	IqODYJmAzr9SZklqukg5Cf4cBWMVIpJ5/ZhZu4iYPC33GHcWxeaZxG2sMInpBtQtF8mT3zlxznKMF
	HPtZaje+Z9D/1FjLvCF0/w+QLuMbh/ADTbNIEGW8zGhO1PcXneXtTj2hdO1NPxgKivME=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v8HRb-00AmdT-OV; Mon, 13 Oct 2025 14:14:27 +0200
Date: Mon, 13 Oct 2025 14:14:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alex Tran <alex.t.tran@gmail.com>
Cc: alex@digriz.org.uk, sebastian.hesselbarth@gmail.com,
	gregory.clement@bootlin.com, linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm: mach-orion5x: ts78xx: simplify support
 configuration with table
Message-ID: <e729b553-98bd-440d-a0e7-bd84448bd9d8@lunn.ch>
References: <20251012235147.325532-1-alex.t.tran@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251012235147.325532-1-alex.t.tran@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_051440_333876_87BD8A11 
X-CRM114-Status: UNSURE (   9.36  )
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

On Sun, Oct 12, 2025 at 04:51:47PM -0700, Alex Tran wrote:
> Replace switch statement based configuration with a lookup table approach.
> The table is iterated through matching the correct configuration instead of
> setting the configuration on a case by case basis.

Is there anything actually wrong with the current code?

How did you test this?  Do you have a tx78xx?

The only changes made to this file in the last decade have been tree
wide changes. So unless you have one of these machines and intend to
add new features, i suggest you just leave this alone, it is just
needles churn to an ancient platform.

	Andrew

