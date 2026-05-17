Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51393CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 08:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxaLP5J/GZlEF9ERJgv3Nk5LgC1koMIzY2yYzqkHqo0=; b=2fCuJZVLfWNkaDtNZ7ul0oyI6r
	UI8NPPeUY4KhgHXOLAF74We0n+4YAnqfE6R2umEleGaz9dasb/cNhMtJwOqIneegisD8pMxOUaAEK
	YzaRnXLurNFyN4hNgbjcAOZRm37iM6uLvs8KXTBc1IljUTQJtVXfawwD0ZSdEbQJJAOG4uWnn4XEo
	VZOM9rrqmqzXWvW9OwLgmztqcz2HVD/VV/JHfWkYMlweInIK+YX7tZ1eqZHkcqmR6FqgOI2A+LSFe
	+HEJDTgZunRmSnzVlmPqjvxsDPEGdKRB0HV70RxSaPmjrvAP6jctiJF8/eLL0u9Mi6K49VEYQ7gKw
	jvvPhEnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOWew-0000000CMHK-3sjq;
	Sun, 17 May 2026 08:15:38 +0000
Received: from vinatta.cz ([2a03:3b40:fe:428::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOWet-0000000CMGC-36ZF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 08:15:37 +0000
DKIM-Signature: a=rsa-sha256; bh=OxaLP5J/GZlEF9ERJgv3Nk5LgC1koMIzY2yYzqkHqo0=;
 c=relaxed/relaxed; d=vinatta.cz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@vinatta.cz; s=default; t=1779005699; v=1; x=1779437699;
 b=PMO/+udeo7XzeJ8ziq0fMVnhQ+lOkfiqksINzGQTUTMbfUvnCquMjhKwC3iwPY69pXYaTPBr
 0sYDtwXBrRrnzTxUb9iMiyQ1fWScUadCw1gNsRPnH3MAf89gDDidD+fIjXGtKdtEbyaylXRkjb4
 KAqHsz2O73Xe2rKMmCUWIhfn6x0SyvfnJuJubOJMAZyWwgoOn7RAC9RN8hQjUIlP9S8R6bWfN0p
 gslmcWbFPc1rV0XGiUzGb/CTfDGc+N/Z2rK0l6C+Yi008AthGl+Yt8jxLtjvtzfoUe37i/vEH38
 XEL331//YH1DNuli4G5ud92X6UHMl0ipgir8EUdNwZs0w==
Received: by vinatta.cz (envelope-sender <karel@vinatta.cz>) with ESMTPS id
 6a5c1ecf; Sun, 17 May 2026 10:14:59 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 17 May 2026 10:14:58 +0200
Message-Id: <DIKSVZCAQES1.35I4QY11LBVNV@matfyz.cz>
Cc: "Brian Norris" <briannorris@chromium.org>, "Francesco Dolcini"
 <francesco@dolcini.it>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, "Andrew Lunn"
 <andrew@lunn.ch>, "Gregory Clement" <gregory.clement@bootlin.com>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>, "Ulf Hansson"
 <ulf.hansson@linaro.org>, "Frank Li" <Frank.Li@nxp.com>,
 <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mmc@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, "Jeff Chen" <jeff.chen_1@nxp.com>, "Peng
 Fan" <peng.fan@nxp.com>, <david@ixit.cz>
Subject: Re: [DONOTAPPLY RFC PATCH v2 0/4] WiFi support for
 samsung,coreprimevelte
To: "Johannes Berg" <johannes@sipsolutions.net>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <DEJL1ATTQMVE.120JV9YW59I27@matfyz.cz>
 <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
 <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz>
In-Reply-To: <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_011536_232409_6A9B48F1 
X-CRM114-Status: GOOD (  12.08  )
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

Johannes,

Karel Balej, 2026-04-29T12:55:23+02:00:
> Brian, what are the options here now? Would it be possible to make an
> exception and accept the patches without the firmware being in
> linux-firmware? This is an old device with no mainstream audience so I
> expect everyone who will want to use it will be able to supply the
> firmware themselves and it would be great to not have to keep the
> patches in a fork, especially when trying to build on top of them
> further (such as to fix the driver-firmware incompatibilities discussed
> in one of the patches of this series).

would you please let us know whether there is any chance an exception
could be made for this chip regarding the firmware or whether there is
any other way to upstream the support?

Thank you and best regards,
Karel

