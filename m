Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E80E8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 08:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IbibiN3Lkpo70lH78L2CAhrcVfhS7UddvlUI33agIVg=; b=SsB0tP8zm0LiHeBp2S0XPoF/kl
	2fRPK4KTioH0RrsHhBRfe3KRipKGCREF9S8hQwdch8ujn7OlTpMg5r2vYv+Su7N6IsxtoI5UHbb9W
	mKaYfgLGbgwjPAoc5juV+DeIlzj6Zwa5W5SZ2NRKBrNyr2yLTj5/w2QNqRLK9NA93dTeciVd8eUnv
	BP+ra8qfneR5OxP/QaKquyyfrEAsRqjdrJv+ROrD7NDrzuC5e2HA1ZZOBEWXY5bnUdsbQ3B883SUo
	xwYKEDV1YpFFH1OCPXLpalIWMobgx1POnRqz1+gtr429EYD9lZYzFi5qVXlbJrhzY52Dfx+q/TZyx
	3Akf+4CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8km-00000003Tz6-1jdf;
	Mon, 29 Dec 2025 08:37:24 +0000
Received: from mail.corpiza.com ([94.177.230.79])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8kj-00000003TyU-1vGk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 08:37:23 +0000
Received: by mail.corpiza.com (Postfix, from userid 1002)
	id ECE358370A; Mon, 29 Dec 2025 09:36:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corpiza.com; s=mail;
	t=1766997433; bh=IbibiN3Lkpo70lH78L2CAhrcVfhS7UddvlUI33agIVg=;
	h=Date:From:To:Subject:From;
	b=FDkJhT5xMhV9Bu1Rj+Eo/sT2v+S+ngNb08VwgV6lyIgizC2MYP+0ulmxLU6GUWlfr
	 FAXQCVlJHgYb7WqidMU249U2GxPB9/eut3mTIKR6x638G7AQvFT1UcBTGeRkDRhxJm
	 1iphcOkmdKtrvewlA0tkZCX8X5DAOlbbvPb0RLGnzEWd6aMRsdUEtJUoBtIeKBP1Yr
	 QPtXIFguaqkOclyDQ8+f29yd4UnPeYcFAFCFVeIRN24G6TnwNVJggMtoNXeHVxTHZJ
	 IiSZUaPIosSyAsJyvGfd5/SfVfm9CakqxZGcKJuYtdbMPyg8SJqvHFlezbs1MI2wR9
	 7tIgW7AjkUUDw==
Received: by mail.corpiza.com for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 08:35:36 GMT
Message-ID: <20251229084501-0.1.ad.14282.0.2zh0mi4xnp@corpiza.com>
Date: Mon, 29 Dec 2025 08:35:36 GMT
From: =?UTF-8?Q?"Piotr_Kami=C5=84ski"?= <piotr.kaminski@corpiza.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.corpiza.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_003721_949399_DE8814AF 
X-CRM114-Status: UNSURE (   2.18  )
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
Piotr Kami=C5=84ski

