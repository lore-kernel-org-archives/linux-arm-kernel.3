Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A2EEF0716
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 06:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXnA0j3/Uan5NIBQI4I1W6jnHOtSk+oiYxhKLyk1rQs=; b=y7oitj/aUjpPYlAiaHpz0ZVpP0
	fM8aaLEWL7fJIwmoPdYoOKWuTB5C02/fBb+mAMYvq0tCalW22soayzccMSPrvrtWOMhwAb/AwYhsE
	SGU+7eLiU1O8+iiCwrDWL2M1y2P3Srsx7CF4GshYT0KzhyJR6lZesrZiivmdx6JrDF2Am48g7UpDk
	hHTgr1cTHux1LtqueTc2SKu1Beovl3yATf3WgIZSGDt5wJli774X3Fa+cUkK3N6nqy7BE58v2STsG
	leMLxZsX5yGYZYAzKyQInRZ1+OWpAXPCD15UK+IizpqzdhUFrtyyC2s0xTftNI0W7CEg6Wvuzqh36
	S0F4g4Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpL8f-0000000Evba-1KmH;
	Mon, 09 Feb 2026 06:52:53 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpL8c-0000000EvbC-0Dp0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 06:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770619967;
	bh=DXnA0j3/Uan5NIBQI4I1W6jnHOtSk+oiYxhKLyk1rQs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZczRkzXwsZb8Vw/Es5bl+YtLjtKWM8ggFl4VnyzivSXkJxsukfBKPb8BKjxgEaSw6
	 W36H3pIY8DaDHOJcdoyF6GV6x/BgedWJJpWgZvXxpXL8WtJDlOSxCCYfd2FvwAWJgb
	 FqU75z1xX1v/DSFsD2qONMNHJH/T63ZXMuOxNJUBhoNlLrO07QT77yZec17HF4tBa7
	 ZTymBHYvEGEJiP3uGTYtbRGzlo9TQUnKhunR6bBH9a1AM2bBigMlp9on8u/kfJOgm9
	 aWuB41PCIGSne8cqrcD0xTGrsZsys4L8ZHW5l7HvvYTFIrgW2F9WZaFklDEAfYXZO+
	 ZV95GtEoFbRgw==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5679B602DE;
	Mon,  9 Feb 2026 14:52:47 +0800 (AWST)
Message-ID: <e7671063304f1bfdb66bc4e7d271c9e836bbe3cc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: add Meta SanMiguel BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Cosmo Chou
	 <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai
	 <potin.lai@quantatw.com>, Roger Kan <Roger.Kan@quantatw.com>
Date: Mon, 09 Feb 2026 17:22:47 +1030
In-Reply-To: <20260203-sanmiguel_init_dts-v2-2-6a5682c32b38@gmail.com>
References: <20260203-sanmiguel_init_dts-v2-0-6a5682c32b38@gmail.com>
	 <20260203-sanmiguel_init_dts-v2-2-6a5682c32b38@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_225250_282854_0030ECBD 
X-CRM114-Status: UNSURE (   5.89  )
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

On Tue, 2026-02-03 at 17:48 +0800, Potin Lai wrote:
> Add linux device tree entry for Meta (Facebook) SanMiguel compute-
> tray
> BMC using AT2620 SoC.
>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

Ah, I missed that there was a v2, however my comments on the v1 DTS
still appear to apply. Can you address them?

Andrew

