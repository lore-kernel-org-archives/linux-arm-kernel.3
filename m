Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67598C87FCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 08:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=; b=jM7+z4KTwbJkKAH2rR/uYb8MWf
	4F1phaBqD1Uwv2yc8kycun2Sbzgq6wLYznKbqTWDth/In5uG68wnOYDrYHmHsSO8eG5UCl/w9VJNG
	j/OrScVrcovixuJcBYboiC0io9p8PuRFCW9Aq99KQc1ux2VLoEKwRZW9FTnUrHeySXC7f+gB7O5g+
	YtxAE1f8mj4uOswC/E/9pyeN81/qgG3+mBgk0rNZjNzetk9zXvzP6iwtjQQZK1x1YxgQwOjeOrfzi
	UkozYK8meYp83xwoc10CC6Unj571fqPUPZCMJJDdKLqHiI3T13r9+2+a7a/qQbwpO18c4OO7AZUxt
	5qQyL/aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufDYD-00000009KUf-3nFr;
	Fri, 25 Jul 2025 08:13:09 +0000
Received: from mail.fintara.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufDVN-00000009KCj-0AEQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 08:10:14 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
	id ADA4B4F793; Fri, 25 Jul 2025 10:06:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
	t=1753430902; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=I5HRT7IQa05XIvKWdqeyfat6CeikiqleBaxNsXHGS5MF10Z7onC2TxstloCxvrqVK
	 NhqOhOHfTgJPHChBev9otqYvCxMyB3R7xaqYm2121lw/S7Z31hyDX5rA3kKSb4j8HL
	 XnGSrG2dRtElk2lZOtbIvvkok4Cs93f8ZeB1V73FpYqkmm5E6Vxs7mSCLqdqW/+q/L
	 +glrgdwK3hXIV9ZqIbVhLUEFuAM6dEg41eerEtjdVROxUJ8ZH+Otr4LT6mG/Jr0r8Z
	 jj/XArHdySEQVIScOwz6FmtjkAA2ZIq9N8II7ARm9I6GvmeeJvuVdrO/GM2cyvxCNn
	 MZvZDRWEHusUw==
Received: by mail.fintara.pl for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 08:06:19 GMT
Message-ID: <20250725084500-0.1.aw.2yc8m.0.4i1df2bilr@fintara.pl>
Date: Fri, 25 Jul 2025 08:06:19 GMT
From: "Dominik Lotka" <dominik.lotka@fintara.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_011013_337111_7E6BA858 
X-CRM114-Status: UNSURE (   1.57  )
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


Pozdrawiam
Dominik Lotka

