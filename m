Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DACFD66BAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 02:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUtkNfhQq2R3Ll3cfb/vT81i7hoJpn+jCi3CzCHE3lI=; b=Y8NtqNBgyCINOKShG1gSF80RwA
	Cwe1UK0Kn1ibxUWnXpUWkEfdmJiDjxPQfWS195zMNfomfO5v9V9GoUeOMkvgNdUrarYzZj0PtXTf5
	ds9V1J8+bGz74qnNa207RGgeEydOk0aUkCK1o/o10QZU5iLzqmwAAT2GKbENztbGdvcWihhuFa2lI
	AtKXOgXzYC267Bkh4zTta88TTLFQrk+SIKO/hNgJFjfLy8cnv2XHRP3m7nR9ietZEaPZ5Ru1rwTBI
	JcZJ/NwqXKTdfVjebadthCi+aLqTVuIKD3MQX6r9guiWR58UNOktAmETplCN3PQ21fB6iCTheAa1v
	R/9wuq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG7WY-0000000C3fx-1l6O;
	Wed, 27 Nov 2024 02:11:26 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135] helo=cmccmta1.chinamobile.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG7VY-0000000C3aq-3QfY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 02:10:27 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee367467f8605b-59884;
	Wed, 27 Nov 2024 10:10:14 +0800 (CST)
X-RM-TRANSID: 2ee367467f8605b-59884
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.96])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee867467f85bf3-4e727;
	Wed, 27 Nov 2024 10:10:14 +0800 (CST)
X-RM-TRANSID: 2ee867467f85bf3-4e727
From: Luo Yifan <luoyifan@cmss.chinamobile.com>
To: linus.walleij@linaro.org
Cc: ardb@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	luoyifan@cmss.chinamobile.com
Subject: Re: [PATCH v2] ARM: vfp: Fix typographical errors in vfpmodule.c
Date: Wed, 27 Nov 2024 10:10:13 +0800
Message-Id: <20241127021013.4953-1-luoyifan@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CACRpkdauGxfiobFHRJfkRYASZ3GhosTuKNPjQc5sFMhWDCR8jA@mail.gmail.com>
References: <CACRpkdauGxfiobFHRJfkRYASZ3GhosTuKNPjQc5sFMhWDCR8jA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_181025_411924_54103098 
X-CRM114-Status: UNSURE (   5.39  )
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

Hello,

I have submitted the patch to Russell's patch tracker, and it is now listed under 'incoming'.

Thank you.




