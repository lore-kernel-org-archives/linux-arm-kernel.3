Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F37E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 15:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27zSPfsDIasiQLrztxpd6KsLCVSNZmztVN6Xdb041vg=; b=nvbm0tPtORpFJfbs6TafYsTl/V
	nlsdIzb4OWIatyxxwOOSBh3h7VVgoLfjYuyKLs8Fukx5X0BOJCsQmr+OOlDtig9K7iorFwH69JM+9
	WNQw3UmmPfKyrYYyupLaOLHH4x9LeDbwZnUfIeWMaZKBwkZHdF3zi7rbDg5b9R/SstMHcfp0X2wWF
	EYO2P2C0pBkDe4vOaadZDegez68XAzn2GB9FiTvD6q8ePc0CSTXb5tBjzpkCPf7RgsnY9WSifjTvT
	U/qhVzqRwCjYDRq6skxwIyT/3r1k0XbgWSCii4iWsldFU+6IF5c7DVpxf4mLgLiBssMbhqUASwiXb
	Fz74HxDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpJp-00000001phw-2LHj;
	Mon, 06 Jan 2025 15:47:05 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpId-00000001paQ-0AO7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 15:45:52 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout4.routing.net (Postfix) with ESMTP id 714D010092F;
	Mon,  6 Jan 2025 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1736178346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27zSPfsDIasiQLrztxpd6KsLCVSNZmztVN6Xdb041vg=;
	b=L3ynFVIoB5wGNLo4IbBxboWIntP5qzxtwKEvdDJ7T/QuH7PvKQcGmnTVOktde6ZkhFTPDt
	6c+abdE4Vb3HNZH3NG9gq3dfW+vMEP7Wzs+yQ6+1NZZaD9bqCOkKi28MpFKwC9YJAqJ/Sx
	cNpUqqpsrhHLxyW3JRxS7CFiAdtLuwQ=
Received: from [127.0.0.1] (fttx-pool-80.245.79.38.bambit.de [80.245.79.38])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 4C9E480155;
	Mon,  6 Jan 2025 15:45:45 +0000 (UTC)
Date: Mon, 06 Jan 2025 16:45:45 +0100
From: Frank Wunderlich <linux@fw-web.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Frank Wunderlich <frank-w@public-files.de>, frank-w@public-files.de,
 robh@kernel.org
CC: dlemoal@kernel.org, cassel@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrew@lunn.ch, sebastian.hesselbarth@gmail.com,
 linux@armlinux.org.uk, hdegoede@redhat.com, axboe@kernel.dk,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_Aw=3A_Aw=3A_Re=3A_=5BPATCH_v1_1/3=5D_arm64=3A_dt?=
 =?US-ASCII?Q?s=3A_marvell=3A_Fix_anyOf_conditional_failed?=
User-Agent: K-9 Mail for Android
In-Reply-To: <87wmf8x8p2.fsf@BLaptop.bootlin.com>
References: <20241109094623.37518-1-linux@fw-web.de> <20241109094623.37518-2-linux@fw-web.de> <20241111203611.GB1887580-robh@kernel.org> <trinity-796b046d-1857-413e-bb82-78e700d6b5ac-1733138371404@msvc-mesg-gmx005> <trinity-a84b41b3-79c5-49b5-9786-eb89f85578cc-1735843472332@trinity-msg-rest-gmx-gmx-live-548599f845-gxsb9> <87wmf8x8p2.fsf@BLaptop.bootlin.com>
Message-ID: <B9E245AC-1487-41B5-A30D-41F03FAA0A2C@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: 8e3ec3fd-240f-4d2b-8e17-bdd50b875e02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_074551_242111_12D9C297 
X-CRM114-Status: UNSURE (   7.11  )
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

Am 6=2E Januar 2025 16:28:57 MEZ schrieb Gregory CLEMENT <gregory=2Eclement=
@bootlin=2Ecom>:
>Hello Frank,
>
>> is there any new state here? got no answer for my last 2 Messages
>
>Actually I waited for a new version following the review and I didn't
>saw it=2E Maybe I missed it=2E

No,sent v2 last days as the suggestion from rob was imho not matching what=
 the patch does (i do not add phys property)=2E So i wrote back, but there =
it hangs=2E

I hope new title is better=2E

<https://patchwork=2Ekernel=2Eorg/project/linux-arm-kernel/patch/202501031=
03724=2E6223-2-linux@fw-web=2Ede/>

Anyone with marvell boards have tested it?

>Gr=C3=A9gory


regards Frank

