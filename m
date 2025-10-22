Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5AFCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 08:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qsFkU/uX4KHJ4f1uzm2iz39kAHCe9u2uFgt0PtntkBE=; b=tXsG1lsiZWEfLb9Grrlm4ZJI6d
	2d//I9J2xgkBvacm/8EwaPfWvM0Ypgi05Inf+E0vWWP3rXaJLlBwX9uTV/JLD90VwG0pJgpb6z/Ed
	EGIf8tnB9I+rMFfCRf31qmkKFoj4yqKIfKGmZnD5a+K9wNylagbRYuaoG00olmtHtLwjIABOcY8D5
	3guLMnYTq8LZO8FBVuuqkpQYVIJrlyljt8OfincEwmNG9AGRiKyNi2qbQ+Bt0z0Fr+5MYesPRxzaK
	WYmlVe2wNXOZVjXDuJ5IyK+frYCGkW/MbESa7wSzZ/MS/CHUFwvwKrjKFJPGepKwhjPVzlISt/IBj
	memu8Eyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUBQ-000000025FV-0AxL;
	Wed, 22 Oct 2025 08:27:00 +0000
Received: from mail.scalenook.pl ([51.91.253.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUBM-000000025E0-2vQC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 08:26:58 +0000
Received: by mail.scalenook.pl (Postfix, from userid 1002)
	id 368ED2900B; Wed, 22 Oct 2025 08:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=scalenook.pl; s=mail;
	t=1761121006; bh=qsFkU/uX4KHJ4f1uzm2iz39kAHCe9u2uFgt0PtntkBE=;
	h=Date:From:To:Subject:From;
	b=Ub6+ZZcY83PHwVHGiKQu2MN+5bm5pIj4LyhExH9wYRytPiErKvO5X0G/AlZqXNa3o
	 ng9wZQOSqpP2eWgfIzDQPBf0F/K9G5Nl8IQhys6yhjwgKT5wFbHyXAAP0EOF0UgeVS
	 Gc59bllIOTgKOdSNYMEa68mMi4P69R+BzIPmoPXqzdosV1OyXhDUt20L+m/x1OPdxM
	 VOlUrIiOBqKNhHIMW6oQz1hcyZoGPL4vEy1OT9onVvoG8kJTRdQ0TpLOucggcZjZcr
	 NHe4O+oUyLbTt1KsTxSe/yYaFUK9nL4cxShr7ahv3cnota6yNtewk5QDeeALrSqc3W
	 S28DkCRFw9pUQ==
Received: by mail.scalenook.pl for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 08:15:26 GMT
Message-ID: <20251022064500-0.1.u.fwzj.0.nmn62lehpk@scalenook.pl>
Date: Wed, 22 Oct 2025 08:15:26 GMT
From: "Ewelina Koprowska" <ewelina.koprowska@scalenook.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Karta lunchowa
X-Mailer: mail.scalenook.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_012657_088931_FAC56851 
X-CRM114-Status: UNSURE (   2.38  )
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

Szanowni Pa=C5=84stwo,

czy zastanawiali si=C4=99 Pa=C5=84stwo, jak zwi=C4=99kszy=C4=87 zadowolen=
ie pracownik=C3=B3w i jednocze=C5=9Bnie zaoszcz=C4=99dzi=C4=87 na kosztac=
h zatrudnienia?=20

Obecnie jest mo=C5=BCliwo=C5=9B=C4=87 zwolnienia z op=C5=82at ZUS a=C5=BC=
 do 450 z=C5=82 miesi=C4=99cznie na ka=C5=BCdego pracownika poprzez dofin=
ansowanie posi=C5=82k=C3=B3w.=20

Za pomoc=C4=85 karty lunch pracownicy mog=C4=85 p=C5=82aci=C4=87 w restau=
racjach, zamawia=C4=87 jedzenie online, korzysta=C4=87 z cateringu czy ro=
bi=C4=87 zakupy spo=C5=BCywcze. To doskona=C5=82e narz=C4=99dzie motywacy=
jne, kt=C3=B3re tak=C5=BCe wyr=C3=B3=C5=BCnia firm=C4=99 na rynku pracy.

Ch=C4=99tnie opowiem wi=C4=99cej na ten temat, czy mogliby=C5=9Bmy porozm=
awia=C4=87 w najbli=C5=BCszym czasie?


Pozdrawiam
Ewelina Koprowska

