Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA90C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 08:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1mulqT0pAzSVUrmF9PlZ7FDSmEsv6eq23fAgCC/7Ymw=; b=WwPYewvAj7tDpy/CPCHN9qvkmT
	mFZSDdbdk5BgwVAx8718JDDeQihcgCLdU0AGDE8/LYKOQFU5irfqUWkHRaWFGEtHDd42LqJ03Abh0
	hC0xl7OehGCeY+fV0otIG7yOU9qqmvHBDAE6kq5Umhjfi31HkWm3nCXOIsqF9VXutz1wt0F5Irfy6
	XILp42LhN6x0VXpq0810GSyIL/H3VRjdfcKDipX8E4QTimmBx+7TTUrCdxzdqkWPE1IN+v7+Hc49y
	/kSjF5qE1TpwY+0UqnCWcI8ZPVMumQDOSAjIBF8bXuadNBWxjJskCdz0IRKe3NxXpOFGyLVgQgSOx
	QTc7FOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tasxe-0000000C25P-2QUl;
	Thu, 23 Jan 2025 08:53:14 +0000
Received: from mail.optiora.pl ([94.177.238.30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taswL-0000000C20J-32uR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 08:51:55 +0000
Received: by mail.optiora.pl (Postfix, from userid 1002)
	id EECBE8410F; Thu, 23 Jan 2025 09:51:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=optiora.pl; s=mail;
	t=1737622309; bh=1mulqT0pAzSVUrmF9PlZ7FDSmEsv6eq23fAgCC/7Ymw=;
	h=Date:From:To:Subject:From;
	b=VKlY91X8LQLOf/8Jm+QQVoro47yBgehFHLBwmP0EvUrzHxafUHtrPnHdYPhOwz0ts
	 RBfZzHgRRUUbOkCl7ocAM+vFS7nWEgvByOFiIWA46vVUl3p9fhLQH0stmmW4MOBlgW
	 2c+vp/OnTLEvNa3jHn9zfKlIQ2/kO4XQe7oL5ekbn+sjVXkBzxgxqCsom1YaV530BQ
	 nSBwJciB8cchbfykCCao63S+nXY8ctA+mLzMnkSEjU4yG18XIHzLpcr1em3JmfrGz8
	 4VafOwJvayEeqc4UXhVycv+i4U/MgG1GEyH+s6bf3Ep7VaQJ56dXxkPo4vhH4dZy1q
	 ELRdpXxUJxlzA==
Received: by mail.optiora.pl for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 08:51:04 GMT
Message-ID: <20250123084502-0.1.7e.mgap.0.kb46p47ero@optiora.pl>
Date: Thu, 23 Jan 2025 08:51:04 GMT
From: =?UTF-8?Q?"Stanis=C5=82awa_Laskowska"?= <stanislawa.laskowska@optiora.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Kandydat do pracy
X-Mailer: mail.optiora.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_005154_438854_7D44DA0D 
X-CRM114-Status: UNSURE (   2.60  )
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

