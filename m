Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC52BC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 23:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vSZIkmUIfKxQKUNMjsZ7esNZ4nNjWlsziqY5zae99xQ=; b=HxoqS9bih01LbD
	Z5nF+0ky3ZfomWEVNgWzfXfqKsyXGTZFaeB/Mz51G+0EbMzgqOZMMzUYmPAsHiG6mIlFOzqwWff/b
	02+wV4w9dVqyWd1om1S22x8ggrIkAaqauHb7sO77ChqZ5FydY/WCZUYIfaSKGGX+pP/y2DgdPJuc/
	BU/SF0GdBwOiiyH4yPg4kalUgRH22zxiT7ZvACLoPWHmF1HUSfpkSiTEOha1KXptZ/+IM7ajvlswa
	cxod2ymnjwVs4HVW1YZ2BUEDjTIA8t+jFJMnMHbxfpTJITHHvAM9mKndKSaLbHKWNCSfPYJ6gw0fN
	9vH7eKibZ+9wYR5KAY0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Fl6-00000004pcc-20dK;
	Mon, 14 Sep 2026 23:06:44 +0000
Received: from rastrek.com.br ([159.65.189.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Fl1-00000004pcK-2P0J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 23:06:40 +0000
Received: from rastrek.com.br (localhost.localdomain [127.0.0.1])
	by rastrek.com.br (Postfix) with ESMTP id AB20A23DEA3
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 14:23:04 +0000 (UTC)
Authentication-Results: rastrek.com.br (amavis) (amavisd-new);
	dkim=pass (1024-bit key) header.d=rastrek.com.br
Received: from rastrek.com.br ([127.0.0.1])
	by rastrek.com.br (rastrek.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OBRs7nHsPnav for <linux-arm-kernel@lists.infradead.org>;
	Sun, 13 Sep 2026 14:23:03 +0000 (UTC)
Received: from rastrek.com.br (unknown [91.217.249.1])
	by rastrek.com.br (Postfix) with ESMTPSA id AA3811F2EA5
	for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 07:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rastrek.com.br;
	s=default; t=1789199591;
	bh=vSZIkmUIfKxQKUNMjsZ7esNZ4nNjWlsziqY5zae99xQ=; h=From:To:Subject;
	b=lkjOdakYPTD9760ztMfFxRhoRWsHnVK4WO6QvqVyGjnMn4q873bcVvm7+bjuuPDT6
	 28Hhp6z1o8x0EbyZdTEShP+SoWyamZiJFUfbQFvQebjLG/pgn+FnJE7RO8RG+D5z2R
	 YJ8CtO0oc5MSmIot5rxCL6PabyWgY0vz2GKYwqRk=
Authentication-Results: rastrek.com.br;
	spf=pass (sender IP is 91.217.249.1) smtp.mailfrom=suporte@rastrek.com.br smtp.helo=rastrek.com.br
Received-SPF: pass (rastrek.com.br: connection is authenticated)
From: "Dietmar Hopp"<suporte@rastrek.com.br>
To: linux-arm-kernel@lists.infradead.org
Subject: Aw
Date: 12 Sep 2026 01:52:41 -0600
Message-ID: <20260912015241.7BB78B42886E3DE8@rastrek.com.br>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_160639_713148_2E5C5997 
X-CRM114-Status: UNSURE (   1.78  )
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
Reply-To: dietmarhopp_1@outlook.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Sehr geehrte Damen und Herren,

ich m=C3=B6chte Sie dar=C3=BCber informieren, dass Sie als einer der=20
Empf=C3=A4nger meines Spendenprogramms ausgew=C3=A4hlt wurden. Ihre E-Mail-=

Adresse wurde f=C3=BCr diese Zuwendung per Zufallsprinzip ermittelt.=20
Im Rahmen dieser Vereinbarung erhalten Sie 25 % meiner Spende in=20
H=C3=B6he von 2.000.000,00 =E2=82=AC. Bitte antworten Sie, falls Sie=20
interessiert sind, damit wir die n=C3=A4chsten Schritte einleiten=20
k=C3=B6nnen.

Mit freundlichen Gr=C3=BC=C3=9Fen
CEO SAP SE Limited,
Dietmar Hopp

