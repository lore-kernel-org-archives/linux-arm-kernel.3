Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B41E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 09:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=; b=t4Vo0kSi2Z3FR26rDo9kEIiiDk
	NYYHtPruwCWsn+O8yWS9U+j9pcOelh8Zr59S70dOJUyXXpWj1TBlLjf7n4HNhtLKEkGoRwqGTdLA0
	bpXuk8zeLsRivTpJRzw3WW/GmQKzVH4WQsOL2h3Np+Y/ypYrPDIDKyUOMzbXpjMtXxXqgdgVZX7sv
	F5J51UBjT2bCFeYov+zj1RBAT8erITJr6TgT1R7gg5PDm/cDsniFjTueFX/DIXs/WTz/tV3/F5dpa
	8fz4x0fEeUyZFgfSekqnLI4p3Ze0KngDMntgtFW/HZOPpeqvYYTjZe9dwOE7qxu1Cvbp61dD4pKIP
	gt4s3VWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWB2U-0000000EdPJ-2ggs;
	Fri, 10 Jan 2025 09:10:46 +0000
Received: from [217.61.0.75] (helo=mail.taskinium.pl)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWB1H-0000000EdHN-1OMW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 09:09:32 +0000
Received: by mail.taskinium.pl (Postfix, from userid 1002)
	id 1D4E183B62; Fri, 10 Jan 2025 10:00:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=taskinium.pl; s=mail;
	t=1736499645; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=EKixwubKBynZF/9ENxegNmHX5dHjcPpd2lR2vOfzh2Yn9uq/Id19otfmX0PObVhYy
	 fk4DYesc9/78AHazeEwCiVrTcEKMnDdYyz4O08TIduIKLJSoBaTZ07ZrxQW6IugUDk
	 y7lG9Kwbx7hBQXA60sw4Gw/zoTeT5EfjRjUxKqrssUL0KRYmWgKogmY192bTEsBcKv
	 4Enehm9/dtbnu7z6AX18PIYT3fBFbD6P2NYr1wGBo8a9BOe4HHN/xbNGF9mImAnQO0
	 7N/w/kGHbwvFBuL6CpfRZ4t1nQVPzw9I66wfJUb9iVx/lnnNUsY3yvKh/RS/mGdrHf
	 IjBfh/FhneLeA==
Received: by mail.taskinium.pl for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 09:00:38 GMT
Message-ID: <20250110084501-0.1.d.1qgy.0.c5zsrhr1zb@taskinium.pl>
Date: Fri, 10 Jan 2025 09:00:38 GMT
From: "Patryk Wysocki" <patryk.wysocki@taskinium.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.taskinium.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_010931_498775_7358D502 
X-CRM114-Status: UNSURE (   3.47  )
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
owych informacji?=20


Pozdrawiam
Patryk Wysocki

