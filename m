Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B006C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 08:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=; b=mbcGHWyoyAqyPy+EF4bW8lL8hR
	tg9X5LvOrgAOyllcL5A3UmaZ6qNsvxHRvfXB2eDFqrJOWqELoksrPey8aA7iHLp8GnztQqhz2d2xn
	Jjr9o00LFZDQFBJ+gthYkzUUj+QUIMSjntHX35XVqM3hhPdduBgdIgzqJfnzAI7UvMvRlegFbDYp/
	asUZE4fI+Dsv8lKNP79rjTcFH9LCmq6sPrF53h5C8Hs6tfP3wFxdgcI/RymR4idwgrcq/GXvMho+m
	TEZt3KEo43hgOYqKdgQNOutI9eKv6cOAQOkSgIuGaLjVuQEtS49bUI9L8WeUWU82V2uBvvUv5/xBE
	UwjY7tVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHI8d-0000000BzFS-0Eah;
	Tue, 20 May 2025 08:15:51 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHI4Q-0000000ByfX-3biU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 08:11:32 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id 783EEA43F8; Tue, 20 May 2025 10:05:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1747728392; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=g3Ta/G+NP5LfygcR5jjTrZ3GkAA2EbJYlyjh9pcHzqH7ZzGQSlyGTnvUOso75itkP
	 Hq1nyYksJ4zwbc9ZbnV3VHMRLK7hQKrYYC/DywFMod5vEVl9xcU6qZCswRiZugXKwg
	 DPF6quImaroccIeIllFZXSdRiGz2t4V1NvB+j/e2N9tk1Gw5cQJPDfhmHUbjEN/s6L
	 6xQ7Hc3WUhQYHZQ5R7Hb+he4kNwXzhvswYbfFHjlrqy6dZbS3qpK+5b/LErY1ZDsoc
	 7lFrw2IThUf10TsfqZnf3fguv3UXlz6g1/NNw5Ko9u6tIEBSACA9H2Xex8Ex8QFJ7W
	 SEFsFRrdRdszw==
Received: by mail.novaplan.pl for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 08:05:36 GMT
Message-ID: <20250520084500-0.1.ln.1yq14.0.lnjbdouq01@novaplan.pl>
Date: Tue, 20 May 2025 08:05:36 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_011131_044267_78FE81EB 
X-CRM114-Status: UNSURE (   2.10  )
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

