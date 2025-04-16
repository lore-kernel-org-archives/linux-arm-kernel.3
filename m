Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A73C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 08:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=; b=nEP69JV3/5FNJ2QdOUnD6FbpNw
	3IYZll3P4dBUIka2w2t5q4kuO/gLfBLjd5G9Ysvp4N0mRD+iee/4wy03yJUMtjv/L6DoPXSmxPj93
	gM+vVwN/xA82O8w+TdNuLS3jZ5drtFMEdLrn5fjuLC/gesehWCVqCNoD9aNTbgA4yqKtQmr9AWpN+
	3fgfGgMmFVq7zTkbhIdSNh739GCUzKgTgisOjHwdswogeqbBT1Hors+Y2bFnUP66IdxtjzvX0mnCE
	6vi7J23AJBmznN+sTJKhNty7lJaWE4bsnsNWxszY5/Ua24orVSCfd+1Nq2OnqKc7yyEhyCX0NN2Tc
	PtV0g9KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xhx-00000008jLv-3yJW;
	Wed, 16 Apr 2025 08:01:21 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xef-00000008iX6-0EUv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 07:57:59 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id 02251A480B; Wed, 16 Apr 2025 09:56:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1744790228; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=kI43pCKp+74UTqIW/sqx91w4NcWHWgDZmRzFpk4XT9yiqG/sse+MEruu+dlMhWrM0
	 Mt/ooAMMQOjLskOYpR5zuB1/w+9ddMSgCfZqVUhUwgQlkjyQRRPvPIt0zoBSz+5G6i
	 Od1RNDjgoXFHLFBnykMX9VGvQkVPhDyCQgU0O63Oa573vEiZ8VoRn2DjIqViJkbJEu
	 CXZP9LbBdlNCcO2AgI6/7kIkX6qmCtJ1yCbRhSXd5u4YD1q0XWQLqgWt1HiCDuE6o4
	 ZuEqThnX6pa8pl5mMVCDl3cJ4DEz8k5DG41/DIKNGCwVKRZk5q0gcaxzOeV1y7E/C1
	 4hO8RnfYKqAVQ==
Received: by mail.novaplan.pl for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 07:56:14 GMT
Message-ID: <20250416084500-0.1.l2.1pmu8.0.3se7f6dveq@novaplan.pl>
Date: Wed, 16 Apr 2025 07:56:14 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_005757_786766_D5E1FCD3 
X-CRM114-Status: UNSURE (   1.26  )
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

Dzie=C5=84 dobry,

Czy jest mo=C5=BCliwo=C5=9B=C4=87 nawi=C4=85zania wsp=C3=B3=C5=82pracy z =
Pa=C5=84stwem?

Z ch=C4=99ci=C4=85 porozmawiam z osob=C4=85 zajmuj=C4=85c=C4=85 si=C4=99 =
dzia=C5=82aniami zwi=C4=85zanymi ze sprzeda=C5=BC=C4=85.

Pomagamy skutecznie pozyskiwa=C4=87 nowych klient=C3=B3w.

Zapraszam do kontaktu.


Z pozdrowieniami
Adrian Liszka

