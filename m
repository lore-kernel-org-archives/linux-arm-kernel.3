Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB96AC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYzal0nBk2uboYjmiBYrDKMFY0tm8Q8fJgnyyHBp/yM=; b=Rom1IFdU9Tp/qtclgb/uKsv8GS
	GqYeDj2lnm5dIZ0dAbnxeOTjo7T62AWINqvnxK2NkkeLc7PkjDF1cL7gwq8ubufz9cSZE2UOtFGOW
	Sqvsk46C6WCvk7lgBiywbqjYb44+OicPkSQSjgH4keqJIeb9GJf7rqEssgJQS/2+19TfhosFRdXA7
	whMCTPV4Ria3GmJugZWayq2+tPa14irhKj1C9cqmJl1en+tR2A+ntydt644ukmGtcCz5PFjOkVC7s
	kbhsQ8q2QsxuqulidUO2sa0gS0PRS8FFc6LqPPnY23Fod0mTexoj+0bDwbtdtB6uhzPUhNRxDxtCl
	S0LT8YAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mrk-0000000F4f4-3gSA;
	Wed, 02 Sep 2026 15:27:08 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mrh-0000000F4ei-1kPf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:27:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1788362822;
	bh=NYzal0nBk2uboYjmiBYrDKMFY0tm8Q8fJgnyyHBp/yM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LV5O/SfjkeSnLJi2I/TS8xRs5ZO3HeCsBvpQI5PIgMkZSZDo6rDg4RZ4ghC6jZI9V
	 r4jOrbeqtMopQYrkFuAanA6EcOY701tVeG7/43o4fjYRZ5p8A3s84cvu4J7/epx7JW
	 1APV7ANVL7cYt55oL6w5JUprExv25joqrgAOy6eM=
Received: from [IPv6:2408:824e:301:1821:c427:8c70:2426:3] (unknown [IPv6:2408:824e:301:1821:c427:8c70:2426:3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 5DBAE65BEA;
	Wed,  2 Sep 2026 11:26:58 -0400 (EDT)
Message-ID: <2368f72ea9a447057456eb37450e1c25f4bdddff.camel@xry111.site>
Subject: Re: arm64: MPAM2_EL2 and MPAMHCR_EL2 are left UNKNOWN under
 arm64.nompam
From: Xi Ruoyao <xry111@xry111.site>
To: Ben Horgan <ben.horgan@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>
Cc: James Morse <james.morse@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>, Marc Zyngier
 <maz@kernel.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Wed, 02 Sep 2026 23:26:55 +0800
In-Reply-To: <0b2c58d2-cc82-4c68-aaa2-83449d0b48c1@arm.com>
References: <CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com>
	 <a491ea12-b0f6-43e4-bb5d-dba508120bfb@arm.com>
	 <CA+EHjTy0jCbEb0K7Sd_+X-Ly_6fC3vuPxmyTVRkqkF_DAFMucA@mail.gmail.com>
	 <0b2c58d2-cc82-4c68-aaa2-83449d0b48c1@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_082705_471600_ECC72559 
X-CRM114-Status: UNSURE (   9.80  )
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

On Thu, 2026-08-27 at 09:41 +0100, Ben Horgan wrote:
> > not, could the caveat go the other way round: arm64.nompam is for
> > systems where firmware ignores MPAM, and should only be set on a
> > machine that does not boot without it?
>=20
> Yes, seems fine.

Sorry for the late reply.  This is indeed the original purpose for
arm64.nompam, a dirty hack when we have no other ways to make the system
boot.  If you think it causes an inconsistent state I'd not complain
against adding a loud warning or something.

--=20
Xi Ruoyao <xry111@xry111.site>

