Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8C6C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 13:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opPvNMDuTsIOlWJ9taPjmpScbI8mys/Oc7h9aXeb/p0=; b=xlmNBbunhbLvyYIipEfqLOlWa2
	f1Eor6x73oPvzJySSD6t6wXZY3iYRscXZSAAnuDYehgetfCjzozXRZRqXCjUDD+JTWLbOCP1Rm36C
	232yhOlZkia6QWgja/uSVV4JYljtyigZoErDg3uBMh1LGX0v6FkDYfPmevz4MSfDhR/EC3Ie30HMI
	pcc0JsQXJ+B+wvIGutv0FLGUXovrDnAW5ilcD/0oz0I6/24WeVS0UR1/ype3PBgZPS83X1GerH1mr
	j5mrmS/p+vZsCyLZFl5aMSOjnuuGq03gyHcemWFgNaJT4g/VNAsm8Wk5E0AqF3dmY9pHGV01LL5xk
	eaR38g1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUoN-00000008mNx-1twU;
	Wed, 09 Jul 2025 13:26:11 +0000
Received: from mg.richtek.com ([220.130.44.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSZe-00000008QFS-3Mjr;
	Wed, 09 Jul 2025 11:02:53 +0000
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1752058963;
	bh=opPvNMDuTsIOlWJ9taPjmpScbI8mys/Oc7h9aXeb/p0=; l=496;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=TejaGzhir8okyyuNvEdvMrYdrzj/xjeRa0gl8w3FG8U76Njz59mODkx97tboy6zPP
	 962ow1QvGLNEepFv9SkLOSbxQ2UPRCcHb0QetWdUiCriO/wEF0OhV0hUytM1e+5nbJ
	 JcSKe6/SCTDhKklJ2AK5pbk7VVkv7Er++9V/TFQCMq0AK4Uk9FtY+yW+nGRJR6HM0h
	 QUIYQgSAxlBFdLu+Rce2AI5+j+KnjRyAzUpgYX0d/Qdeps77VWlsGVruLP1Oaoy1Ww
	 NS/gEnT2ynUCtB6nTDC2HpD6NEp55BHhmwzwnYF6AfG/R44yhYCWY7KazJ4CMF8Ig7
	 Aj5aVgfUaYpGw==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(244572:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Wed, 09 Jul 2025 19:02:22 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 9 Jul
 2025 19:02:22 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Wed, 9 Jul 2025 19:02:22 +0800
Date: Wed, 9 Jul 2025 19:02:55 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "ChiaEn
 Wu" <chiaen_wu@richtek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mfd: mt6370: Fix the interrupt naming typo
Message-ID: <aG5MX/vVwcOHrjwD@git-send.richtek.com>
References: <a6ab943f4660e39b8112ff58fa97af0507cd89e9.1752026324.git.cy_huang@richtek.com>
 <CAHp75VdXjXgdoZBgKHc-YcGFR-voPboXK8DHbN3ztWuf5jKigA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdXjXgdoZBgKHc-YcGFR-voPboXK8DHbN3ztWuf5jKigA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_040251_872503_F476115F 
X-CRM114-Status: GOOD (  10.70  )
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

On Wed, Jul 09, 2025 at 11:36:25AM +0300, Andy Shevchenko wrote:
> On Wed, Jul 9, 2025 at 5:00 AM <cy_huang@richtek.com> wrote:
> >
> > Modify the lowercase character to uppercase.
> 
> ...
> 
> > Fixes: b2adf788e603 ("mfd: mt6370: Add MediaTek MT6370 support")
> 
> Doesn't look like a real fix to me, although code looks good.
> 
Yap, it's just typo. So should I remove the 'Fixes' tag and resend?
Or keep waiting for other's feedback?
> -- 
> With Best Regards,
> Andy Shevchenko

