Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567C6CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 08:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YccsrTHMaKf8U2PNLRc4rk3XTmEZZeorct3+VE5wz7k=; b=ZOaIEyr4+5OpMWzIo1CgkmMUAb
	FteZogB1TXI7USspKA5Dggrw0I+uq7PBKw80L/b2XtA2ANJKPD/wu283m4sOX+WsBI8W5SliLUdeT
	vZ2f6u7nwuuKflFgDwOJIZ5CAOlQQfGwCMeWyMSWxjDJCFeH5mIxSseW+dnFQX+1lq6MvHYq4XMwV
	Kr8+xMrp3v9EDuWE3PFqcIOOQmIt/yuK9EWBpKgI1XNp2pEkOkes5aHPy0oHBCYrgwj4cL+HiMojW
	oLeLCfHx7HHaJCtbUcgw32SCmjB4ryakz3xDMSrzM5/QwqoIpcGLn+TSOiMtc7lgQxU8L2xLv68Dl
	IRFlLsfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwccx-00000001o8y-48xG;
	Thu, 11 Sep 2025 08:25:59 +0000
Received: from mail.taskario.pl ([198.244.149.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwccv-00000001o7d-0QXG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 08:25:58 +0000
Received: by mail.taskario.pl (Postfix, from userid 1002)
	id A5D752A7D8; Thu, 11 Sep 2025 08:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=taskario.pl; s=mail;
	t=1757578339; bh=YccsrTHMaKf8U2PNLRc4rk3XTmEZZeorct3+VE5wz7k=;
	h=Date:From:To:Subject:From;
	b=F5PptocmgShPc3YwkkKyOYb5RtyPz10F/XHPrQQBMcuGRiibgz7APSIWNO8vAPG1H
	 fncLVQrIElETb2BmirNYZ7MatlauXiF1uvnRU/e9eBfHFdzOMJEqOgayyQ1ayjVf6r
	 3IuR/Kd/aUUwLBRhzv1Q8PL8nOgPi6kczNOawW51CF8otSy8M8BTwHfQZsV0ce7sLr
	 Kdq+QFAsgt94mfJBnhnFP1zdMKw2L17ZWxF5KM0tpiqCLbVodFSOjrFtTJK8HbjsbE
	 jlf3mTg3ld++T67ACrdwpGcFfSCGRydxgeH/gpy8SFnMs8Au2GwXJupHRLTaFuxB7B
	 jb3Sn5CJ4u4yQ==
Received: by mail.taskario.pl for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 08:11:07 GMT
Message-ID: <20250911064500-0.1.3w.p5qt.0.2r0jkna0kp@taskario.pl>
Date: Thu, 11 Sep 2025 08:11:07 GMT
From: "Ewelina Koprowska" <ewelina.koprowska@taskario.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Karta lunchowa
X-Mailer: mail.taskario.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_012557_404339_C39249DA 
X-CRM114-Status: UNSURE (   2.39  )
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
Senior HR Manager

