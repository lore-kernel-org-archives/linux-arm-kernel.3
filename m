Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE89AC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nKFyL6kHGsUkO+q8agC+zR0Go57BP4LT86ehYkplXn0=; b=xUYNDAI2TzIQNd1mXR1cBCt3k2
	2HyuFm1/jmcY3SQcByhjPTBtDTVeUFF915jrpp1qcf3M/eSAIRFKy82xxTk1yPyj4uF1BOmPQo1Is
	u/6/WbGFXCYOe2cgq/cBcN7kVriCymfKrxxkxYRFjIPw+7nhz/nEUNlX1s4DVrEOqEuKH2CIUV1uy
	WkJbnXRvXaNPVvksh8AqU2ANpvlqyTcIrCraPE4Uta5518y4q3yJtdmPCmQ5UQ4MCftDY9j9Rd6kE
	CIIEt2G0FZOUDN2JWoAznGQ5vppuvvwYENX6ftnjWVImcrvfx0FlDLa1cgBX+QNqPsdDDMQVgisjN
	AYTGCiUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcFg-00000001yC7-4AR2;
	Mon, 23 Jun 2025 08:10:04 +0000
Received: from mail.quantro.pl ([51.195.47.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcDK-00000001xnJ-4Axr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 08:07:41 +0000
Received: by mail.quantro.pl (Postfix, from userid 1002)
	id 4C8B42537B; Mon, 23 Jun 2025 10:06:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quantro.pl; s=mail;
	t=1750665991; bh=nKFyL6kHGsUkO+q8agC+zR0Go57BP4LT86ehYkplXn0=;
	h=Date:From:To:Subject:From;
	b=Gy64qcWz7jS4prApTpVmzeXSyF6B6MRwiuzGcn871Zqh209C1xefeLyq98Gfthenm
	 3yZR77Cr5jd2xLIU75PA+Z5nDSNi0uySpXQ7ilX0dICa+RhsoPZTOSAh3Km6KM52Jp
	 yqPAFyiJWWFS5CR69wcEFBaGs1NpNnpJDl5Ej3+FldKdMJNgr2T/XstWBZ4WEOHwgA
	 3gVIBp5sT9OputOhVY2VtostmvPOyuTQAZJ7SU6v2nUIct+8ddBfH/U4ZbwH6z87Xp
	 BVYaaEB4Ht32DISDSFee2Z4G6BRwJ24mk0tu43YhukuFazgW3wA3U+oTfShLzWr5mD
	 8E1K7lxMq7LAA==
Received: by mail.quantro.pl for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 08:06:07 GMT
Message-ID: <20250623084500-0.1.ib.5jgxk.0.8qje3qd3na@quantro.pl>
Date: Mon, 23 Jun 2025 08:06:07 GMT
From: "Ewelina Koprowska" <ewelina.koprowska@quantro.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Karta lunchowa
X-Mailer: mail.quantro.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_010739_739888_A8FF8988 
X-CRM114-Status: UNSURE (   1.47  )
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

