Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85515D3B7F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=; b=JbD2Qfm+6XHVs6KDjDHO6X1Ktj
	NCieKV0AocSr0hEC67tWNBnEz0sHEVY0hJ1NcCeJ4fXNfOAZYRZqs7EW0NBfS7xSi8w/tDhrnvzBv
	5oanBLNze1LjOd3UX4j64LjESD6zz8XCetDnTMcB538Gz8UqP07iL0CmTTVK7H1x+PeilLlLNU9fk
	awyI1WpVMDufxcbFgz1i58gO1iP3H4vvLZC0GwA4cn/flPHSvtRGjoB7K/PA1BWUT9+qrNxAVtJav
	UOEtvghOGypq7Bg+uTITxmrD+tMNsyOxnmk84K/5LeEsqEYNRkpooXzRQDzVyTjxE1W1CLud3XVdn
	OyNMB75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVAv-00000007WGJ-1N07;
	Mon, 25 Nov 2024 09:14:33 +0000
Received: from mail.sharpwise.pl ([5.249.155.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFV9W-00000007Vvr-1WRo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:13:07 +0000
Received: by mail.sharpwise.pl (Postfix, from userid 1002)
	id D826383FFD; Mon, 25 Nov 2024 10:11:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sharpwise.pl; s=mail;
	t=1732525962; bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=;
	h=Date:From:To:Subject:From;
	b=GrJdTP2qYumCptgxN2JmqbM7IaCIivvBkBLeFvQF2CgxjHP9b0HZ+TzXfiwT6WBmM
	 E20w9/bXVfk9eiGVRoWIt51EiiqVxi9BfyTw/Cud0gkoFf/6RyVBSI3htHIpxZWrSs
	 ZvFc4VjfCYOA6cyOx3K1OTiJfkzICjHHV8P3c/iAFpoihOPrpObEO08M6rbitnEnr2
	 EQySkVwkpGwLoCzfRAvPLWyBAUA4wqYS6IAOSrQWql/RGSXJf84Z5BSQMhkA1ecFXD
	 W/GD0LoF0WXCI3M4Ue/C1fooEgHVEGo4iOT1L0MICNZNv1q6029tOrnQvgRg7zmgx7
	 Ur1xXMz/Zfb6w==
Received: by mail.sharpwise.pl for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 09:10:51 GMT
Message-ID: <20241125084501-0.1.82.1aknu.0.ihcdlklffn@sharpwise.pl>
Date: Mon, 25 Nov 2024 09:10:51 GMT
From: "Patryk Wysocki" <patryk.wysocki@sharpwise.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.sharpwise.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_011306_546462_13398727 
X-CRM114-Status: UNSURE (   3.25  )
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

Pozwoli=C5=82em sobie na kontakt, poniewa=C5=BC jestem zainteresowany wer=
yfikacj=C4=85 mo=C5=BCliwo=C5=9Bci nawi=C4=85zania wsp=C3=B3=C5=82pracy.

Wspieramy firmy w pozyskiwaniu nowych klient=C3=B3w biznesowych.

Czy mo=C5=BCemy porozmawia=C4=87 w celu przedstawienia szczeg=C3=B3=C5=82=
owych informacji?


Pozdrawiam
Patryk Wysocki

