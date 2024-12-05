Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221DAE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1mulqT0pAzSVUrmF9PlZ7FDSmEsv6eq23fAgCC/7Ymw=; b=cZ/0ljWhpYZEeuccZPgVqG9mbb
	o/+cwCMFSj1h1nrNvKC7tN3vDc9kZ7oxhraTMQEmpxOnqdPtW0CB3mcEYjg/UVmp/cea2yTUXT3fk
	jVJIQGJ9Taujdt5aDlIUp19uMjgjd6iQWjdDI3ZXXLBsZwDH4PXqPcpYA051S/bdu+uUgWvIcQVmP
	znaw2E5NXRqL13CsUGahbZCQ0fTVUQXCymbobkPQAvj+EIoVbPyL3tuk6odH28QbRXwavWNniGQQW
	gDMWv06fH2LGN2ZII0EQkhQvzSsmCb3uP/OULzTVUZY7on8geALKIvvD98hgl/AOHzEP55YUgwUBE
	K/zt2uOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7zk-0000000FKju-1yPq;
	Thu, 05 Dec 2024 09:18:00 +0000
Received: from mail.agreementdeal.pl ([217.61.97.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7y4-0000000FKLW-2CvX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 09:16:18 +0000
Received: by mail.agreementdeal.pl (Postfix, from userid 1002)
	id 13C0884BDC; Thu,  5 Dec 2024 10:16:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=agreementdeal.pl;
	s=mail; t=1733390165;
	bh=1mulqT0pAzSVUrmF9PlZ7FDSmEsv6eq23fAgCC/7Ymw=;
	h=Date:From:To:Subject:From;
	b=p649C9YJwlcgHhzUyuan7tk5NYmH1j4hSXZ8T+UKZ67S3Wo3JmguATSNeWmJ5XEPN
	 FZ4eJcsqIq0S4OQhjnPHmJKXh6/boLFRkXO9f0Vg/niJwj8hOYeqPkLCF6vJfryByx
	 jC8mmjlQb8fP6MAR9fEHDzg5/0VWwW/wuxI9vV4s1nWeywpHqeUnxsmUqzjyb4fEMF
	 m0HJJ3oJT0z4Ecpibv8dJeXfQJGb4sz9Fn0LNyE2nUEhvSqlYFJrNMrst+rSqyygXI
	 fXeJGeOJYnXmmBS+riVHk4ZeVIV7NwQa8HltbSc95ildg8m8H92zBE/PUw39oSgc7J
	 RYxGKEsqNPg+w==
Received: by mail.agreementdeal.pl for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Dec 2024 09:15:57 GMT
Message-ID: <20241205084500-0.1.4u.19amr.0.q2sotq2092@agreementdeal.pl>
Date: Thu,  5 Dec 2024 09:15:57 GMT
From: =?UTF-8?Q?"Stanis=C5=82awa_Laskowska"?= <stanislawa.laskowska@agreementdeal.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Kandydat do pracy
X-Mailer: mail.agreementdeal.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_011617_242769_20789CE5 
X-CRM114-Status: UNSURE (   2.42  )
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

delegujemy sprawdzone osoby ze Wschodu do pracy w firmach produkcyjnych d=
o prostych prac przy produkcji, na magazynie, przy pakowaniu towaru czy k=
ontroli jako=C5=9Bci.=20

Nasza firma organizuje wszelkie formalno=C5=9Bci oraz zakwaterowanie, co =
pozwala zmniejszy=C4=87 koszty po Pa=C5=84stwa stronie.

Czy mog=C4=99 przedstawi=C4=87 szczeg=C3=B3=C5=82y?


Pozdrawiam
Stanis=C5=82awa Laskowska

