Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931D0F013F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMdyJKTxV9bkaRt+aS+VoCDjmIeGU1rx1qmRc6qB+O4=; b=3RcJiEOQRMxIIFJZCAEeGXOyfg
	p0I0nq9IL3lBQeTTxi0APr8mqaIbLj79fw3GVFd/3oZ3DE8J+6AJVnBQMsTbMja7U7vKK28RnFB/x
	u2NP7LZAMDodlfqhhW5iaGZkmGqVH1DK+84zo8jFbBBv+8ZRUssGe8TEC2w38e94Atv84Wya7DuRi
	nGAYK2+J97bNL5nyKL2biK1qM3BVZ/ktMyBBA7htPU0MG/ksUn92FPBnbG99qWepNhffRLYIC2xSO
	26NRrS0XkUV7ZE4WWGQahWXxYHrxi+m/YqeMu3Hn6W7L7KBdXrEd16DQQa/2om3S9as2aGGm4+MSM
	jsn6vyjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w240C-00000003byN-2aKy;
	Mon, 16 Mar 2026 09:12:44 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2408-00000003bwH-2K6f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:12:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 267284E426D0;
	Mon, 16 Mar 2026 09:12:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDEDE5FC4A;
	Mon, 16 Mar 2026 09:12:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80135103680A9;
	Mon, 16 Mar 2026 10:12:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773652354; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XMdyJKTxV9bkaRt+aS+VoCDjmIeGU1rx1qmRc6qB+O4=;
	b=sl7cOmPxOBByV2Wg/r9auwL1PSRhZ5BhyW7EYgNtKJjC5vkTdWs5Bda+nDMzbykfNj0OWy
	GVouwCYuWsT9pONEmnyovcdPq+s46bK7P281V1Lh53fhgD7cOdtfhODVkbPX7vDWa+u7sM
	M2Aypbq9t65k9dGtVIXwnb2QRG4dFPKSSWYExteVnOFQ2FuHHTxCW3JeZGqKnLOQgbYVQz
	diQ9ulCLwTleo7FBxYlvR9JBp+n9i05yZ/qr1JQHPwtR1Ed7gpALebf5AE4Xqc9Y5hudiA
	6DHeY3l3TmyDTQMGLQ6KONrnobcMvomSSm95DMCjdYqpWaVAyqAiAsGJ9qSvDw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, Andrew
 Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v7.0 (#1)
In-Reply-To: <20260314-illustrious-origami-pronghorn-964508@quoll>
References: <87sea3680w.fsf@BLaptop.bootlin.com>
 <20260314-illustrious-origami-pronghorn-964508@quoll>
Date: Mon, 16 Mar 2026 10:12:30 +0100
Message-ID: <87ms085e9t.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_021240_894453_908EBED0 
X-CRM114-Status: GOOD (  12.61  )
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

Hello Krzysztof,

> On Fri, Mar 13, 2026 at 04:53:03PM +0100, Gregory CLEMENT wrote:
>> Hi,
>>=20
>> Here is the first pull request for fixes for mvebu for v7.0.
>>=20
>> Gregory
>>=20
>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f=
27f:
>>=20
>>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>=20
>> are available in the Git repository at:
>>=20
>>   git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/=
mvebu-fixes-7.0-1
>>=20
>> for you to fetch changes up to edb7efa767da8bb82d724b85178be251ec4e060e:
>>=20
>>   dt-bindings: arm64: add Marvell 7k COMe boards (2026-03-13 16:41:11 +0=
100)
>>=20
>> ----------------------------------------------------------------
>> mvebu fixes for 7.0 (part 1)
>>=20
>> - Add bindings to validate the device tree that has already been merged.
>
> Merged when? Why is this a fix not a development (e.g. documenting
> something 10 years old)?
>
> Please write informative pull requests. You want to here provide the
> context WHY maintainer should take this as fixes.

Okay, I will add a reference to the thread and a summary. In short, a
new device tree has been merged without the binding, which caused
warnings when running dtbs_checks and annoyed Rob.

Regards,

Gregory

>
> Best regards,
> Krzysztof
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

