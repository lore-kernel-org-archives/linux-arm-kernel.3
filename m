Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC72D5B164
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 08:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZhumA9H/VCLyAE6Xlv51DL95rNbHDjZYgCI0sDtictk=; b=C2AahIsGl8B9Hz5Prtda0KJh0B
	FTn2iFqayxt82kwuXwEs58vdrESZ2/EuO91COR/wxTvd+WuDX2dZjXFEMW/cZ9rcObHI/GrbTMsdP
	ttNrFEhDmG7cmmU53LVwdS+JBLY3OUhSnrRyv52140y3mVtlMthb6jSN+CStY7P1gl4gps0Zp35Pu
	MLe2zx4WuFU5KOeDVqG9w5JaGVWqJtp+FzXfEv3elvOyx/Yo7AA9J6ZuVHhfkyRMLwPxhblvTT+HZ
	76OKFdOdWaLjXtQPVzYh4/V71dDnqM6BweRAmlhyquYFtgivXR1KwQu1mnuuldX9WuFtYQ4m4efdt
	cSSYthyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5i3e-0000000DnXt-23L7;
	Tue, 29 Oct 2024 08:58:34 +0000
Received: from mail.quikbyte.pl ([91.134.88.136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hpF-0000000Dj58-0EqC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 08:43:43 +0000
Received: by mail.quikbyte.pl (Postfix, from userid 1002)
	id 715C824D10; Tue, 29 Oct 2024 08:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quikbyte.pl; s=mail;
	t=1730191321; bh=ZhumA9H/VCLyAE6Xlv51DL95rNbHDjZYgCI0sDtictk=;
	h=Date:From:To:Subject:From;
	b=RKMjt5ricOTqdpSYX/F0aXz/m9BT7bRAS9nw3zDrS70Z5j8lpiOVaYsPsI2EBJ/Wa
	 JDws3Bs6DNS2M8cfDO9BoH8uFZwkatlqNuRs8IxYdK3C1qWxG0n7x6SiIjBeENIhf2
	 UyZ5TNOPfjB/ZbA1mSyTCP4hsfoV38DHBNRwNlLrjZwBUl8bfBqbQe1d/a6w2pWy0/
	 eHwGAHQ+kZu0kt1E86m7LKhNP5cnOXXhJvOAHF6a4XKW65qyOSF37sX2Kmaq2Bqn9u
	 ZdD3EVaZ0ODv8idfjoSiT8wNXweWrx1Iu3kN2RbmIbvoZ7TBKJ1/4DxJZ6L3tl+k9p
	 owED1ICLHl9Ww==
Received: by mail.quikbyte.pl for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 08:40:49 GMT
Message-ID: <20241029074500-0.1.3b.q2az.0.pvngwe9zm3@quikbyte.pl>
Date: Tue, 29 Oct 2024 08:40:49 GMT
From: "Piotr Firek" <piotr.firek@quikbyte.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.quikbyte.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_014341_790626_E23546AB 
X-CRM114-Status: UNSURE (   2.28  )
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
Piotr Firek

