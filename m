Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C77C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 07:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3R0DPJde5QP/N/HQ5yaIUnWadGPDvaKYjHWsht6yKtM=; b=UiX1f97z6kQ/KT6KDrd8lO4CRc
	mO6bAYU2hxPqfVNdVBiiO+Um/mysn783OxJ4HGkjS+E0jUZfitfBOv+as337Qct/OF2NPrF53hAyx
	jgvgLPgdvGokdG7YE83D/RJVHJVNDn54reTTH0Hubel7yNVSb8BVyNc9Ohkmd/2qm8GFPcfgp9UuH
	i3+HkASz9/BSUZl54O/C7+fViO/0a2S5q3KA0ZFksTHlr6R6gGeHMgtbeWOgUyrMGi1M2iotONxpI
	R1ZJU/MiFLtmdPK3w+1lBDkXpjsYT7UooewAG3X8VXxs3xYxDqi2YHXIcY8HuYAZgXnvEvKc2Qtjw
	GQkG95aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBWT-0000000CTDy-4AWR;
	Wed, 28 May 2025 07:48:25 +0000
Received: from mail.profinix.pl ([89.46.78.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBUL-0000000CT0w-2PQd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 07:46:15 +0000
Received: by mail.profinix.pl (Postfix, from userid 1002)
	id 1BD8183BD9; Wed, 28 May 2025 09:46:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=profinix.pl; s=mail;
	t=1748418372; bh=3R0DPJde5QP/N/HQ5yaIUnWadGPDvaKYjHWsht6yKtM=;
	h=Date:From:To:Subject:From;
	b=kw5r/JkLxnlRk+psc7BO/C3fvKLy+K9GCUgGCAUJv07fQKFi/W6ncrVUJXQtU03rN
	 GJDeDxJ7ffAuXNskrGs6+5UBFpAdw+3lOCdhdamXnWjAIHcp5mYOk3MCGc+RICojZE
	 IQudOV9NEvAIDWpSMBa1zMTh/mvQbYNma6XxbfypDHuSEgzWWzgLHq8y9cYLKdHIZ9
	 i6ekhw4Oqz6S88Jjw8XqwEMzXEqwgrwnOjKrG1khTnGFLlDviGPczSz4iFhf+qMsUj
	 OFKIQZWR+RDghJgBAPDNZNIcV0L+xKd30sIC/6VwKxHLUlBEzJbmVgNpCIdB5vC/O2
	 1YvvdifOqb2gw==
Received: by mail.profinix.pl for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 07:46:10 GMT
Message-ID: <20250528084500-0.1.fu.5xtg4.0.e44d889mht@profinix.pl>
Date: Wed, 28 May 2025 07:46:10 GMT
From: "Filip Ostrowski" <filip.ostrowski@profinix.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Prezentacja
X-Mailer: mail.profinix.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_004613_765004_8A818C72 
X-CRM114-Status: UNSURE (   1.59  )
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

Dzie=C5=84 dobry!

Czy m=C3=B3g=C5=82bym przedstawi=C4=87 rozwi=C4=85zanie, kt=C3=B3re umo=C5=
=BCliwia monitoring ka=C5=BCdego auta w czasie rzeczywistym w tym jego po=
zycj=C4=99, zu=C5=BCycie paliwa i przebieg?

Dodatkowo nasze narz=C4=99dzie minimalizuje koszty utrzymania samochod=C3=
=B3w, skraca czas przejazd=C3=B3w, a tak=C5=BCe umo=C5=BCliwia tworzenie =
planu tras czy dostaw.

Z naszej wiedzy i do=C5=9Bwiadczenia korzysta ju=C5=BC ponad 49 tys. Klie=
nt=C3=B3w. Monitorujemy 809 000 pojazd=C3=B3w na ca=C5=82ym =C5=9Bwiecie,=
 co jest nasz=C4=85 najlepsz=C4=85 wizyt=C3=B3wk=C4=85.

Bardzo prosz=C4=99 o e-maila zwrotnego, je=C5=9Bli mogliby=C5=9Bmy wsp=C3=
=B3lnie om=C3=B3wi=C4=87 potencja=C5=82 wykorzystania takiego rozwi=C4=85=
zania w Pa=C5=84stwa firmie.


Pozdrawiam
Filip Ostrowski

