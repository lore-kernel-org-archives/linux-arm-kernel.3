Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAF5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 22:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lwV7aSIhmL1J4zqGd6QcK0kku1jHwWFZZp7wr11vEIE=; b=OPVWypOrwE2Rtx
	xQGPuvK7O4ZHIbgcF2s3JtwcdjprBryMbF3x9oCsx2WhghVXYndhMxYpwzvwd8ufr5rSSkXX9cckS
	q2Pqs9xrLPV/1s2LKYEy1Fywckq6rq/ISvARd8Dqv0aBXLkNKOt9GHRiUKeCaCnU5wSFVVrTBbOi+
	mKs8vNHaCUwFd0Rd2YfPCWqxRfghFv8KgidsHsc2kUgDFDMJkYFaLWlzlMYcApp7Mm7MKFx+Eq9bu
	lm5xGboyv51ibDnZV5mMsvWacFvTIEURgBo+cS3JbDmOYdlZnPadaFpeOZYSZb36tTwZzgtTYQ1o9
	wnjZ4K+TkIm6xri1549A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQwUb-0000000GYtH-2wzO;
	Thu, 26 Dec 2024 22:38:09 +0000
Received: from 217-110-162-10.ptr.prolan.de ([217.110.162.10] helo=smarthost-3.prolan-cloud.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQwTO-0000000GYoQ-4Bdv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 22:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tautiimagheraus.ro;
	s=default; t=1735243276;
	bh=lwV7aSIhmL1J4zqGd6QcK0kku1jHwWFZZp7wr11vEIE=;
	h=Reply-To:From:To:Subject:Date:From;
	b=QheFnIHQV1LcPeiNrw31Z/IxFgvbywDp9nGDSV5MqZwF37I6Yw/lTYlcG5DMtSP7Q
	 Gn3/qgfPLaZz2YMQNqg+ACVgKoqMdx7BX1glyITsdt7MMfR0loxlAxlt2jTjMM8a3C
	 DF3aX+bZXpvIx+aEEwaMdhqx4I0Rb9J+18/k/OW07u9MzsxELrJv0TIm4pmPk/zZTM
	 VFEr2AfGk1zgqdL+qpyYotZfTWQX8L1uW9M7BPybWHnsEw9iGqSxrDZrBcBG5HqegX
	 eRgRmoJQoeA8HTnJzxeBvtEsFeW5C7Z/c6DDAI9RcBksy13HGrEqKm9s5Nmr+EbR7i
	 /5amlDzrbj5cQ==
From: Kazi <proiecte@tautiimagheraus.ro>
To: linux-arm-kernel@lists.infradead.org
Subject: Business request
Date: 26 Dec 2024 21:01:15 +0100
Message-ID: <20241226210115.F4EA812D071EBF93@tautiimagheraus.ro>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_143655_489659_96DC2FF4 
X-CRM114-Status: UNSURE (   2.03  )
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
Reply-To: admin@bceao-tg.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Compliment of the Seasons

It is with great sincerity and concerns that I address this email to you.=
=20
I have contacted you in the past regarding this project partnership but you=
 didn't reply the email.=20
Did you get the chance to see the email?

Looking forward to your positive response.=20=20

Best Regards,=20
Kazi

