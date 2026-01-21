Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8413AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 09:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q8rYVmzeb0BIhBpMFUreKtfVcFEbEBQ1myveAe1Z1DY=; b=ap7aQtj8A/iM3Fm6ra9Szng7gt
	jxxnEgfDvjikPjXy8vieHL72VkcHVL0by55dFBdz/FHW2T3pQCb5Kiw6tn4fWIQc9NOkX4ihU9faI
	qjfDY2Wly+bvKL94ZSlP/5tD6irnmJQiz5dW+YQBgLWJHSbHeEQpdQ2oMPcD8yTdPI4i5nEVDQQy6
	27vi6APw0K1jzKvjd3eabjP65E5oQ0y3DE4l+M25piP0Yy461lUywaW+TkbRjcalPsnWn/MjLiavf
	joWig1UnUWtacMtOvmVlcf71cSfvGTc8/k2YPM4cYJgaUA3aDvdGwBxKvtJOIG3z9mn//8AIk68oY
	zZB2iFWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUGv-00000005A81-3YrJ;
	Wed, 21 Jan 2026 09:13:05 +0000
Received: from mail.vexro.pl ([141.94.250.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUGt-00000005A5F-0fWj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 09:13:05 +0000
Received: by mail.vexro.pl (Postfix, from userid 1002)
	id 4ED03A55F2; Wed, 21 Jan 2026 10:11:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexro.pl; s=mail;
	t=1768986734; bh=Q8rYVmzeb0BIhBpMFUreKtfVcFEbEBQ1myveAe1Z1DY=;
	h=Date:From:To:Subject:From;
	b=jKaZvnj1jtSmlE9loUO4clogyhgHgYfWULiVoiOclczLhxDK4bm6mkcYPS3HM9hWz
	 g/gGKNHVikVlcFN3G0uZEVA4uARFG1koH2Kp0v2jKbwFArPxuNkW8iL010RBkix9nv
	 lRaK8mb9EeDMTCMbTvmiy7aELtyguUHAgLIMnBZXE52AElDUuWsZ0HNkgyjPOu7LNE
	 CXQax8oUyzEWvMJU0jhAtf2GzpbsHiXPQIETn16xLo/5sZCGOlDLY7OLqJUdJIR4Ia
	 52yLJz/HNeE719Xt8NYXA13cWFHIKE2Of91VpoT3xY6iEMUNHeofIXt9XHXZ8XbhU2
	 f1gaLrk1JtXxw==
Received: by mail.vexro.pl for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 09:10:50 GMT
Message-ID: <20260121084500-0.1.pt.4z1x1.0.6cexn9oggk@vexro.pl>
Date: Wed, 21 Jan 2026 09:10:50 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@vexro.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.vexro.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_011303_758357_35F4C22D 
X-CRM114-Status: UNSURE (   3.16  )
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

zajmujemy si=C4=99 wdra=C5=BCaniem systemu, kt=C3=B3ry zapewnia pe=C5=82n=
y nadz=C3=B3r nad pojazdami w czasie rzeczywistym, usprawnia planowanie t=
ras i redukuje koszty operacyjne.

Platforma automatycznie generuje raporty, wysy=C5=82a powiadomienia o sta=
nie technicznym aut i dostarcza danych wspieraj=C4=85cych decyzje zarz=C4=
=85dcze.

Czy byliby Pa=C5=84stwo zainteresowani kr=C3=B3tk=C4=85 prezentacj=C4=85 =
lub bezp=C5=82atnym testem systemu?


Pozdrawiam
Adam Drzewiecki

