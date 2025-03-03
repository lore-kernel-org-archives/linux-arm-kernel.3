Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B02C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 02:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6HfdgFCpqOX4tTcQS1T7RF2ySV+PscV4E/w42OUfLFE=; b=kglOZxbWAqrtuT
	hCwQ7/Fp8lKBiIlUZxaH0HPv52lik8v4oex39wPjpde0+T3iA+p5FLA/Xi6NEGFXjgY8oL7fQq5WF
	+wBCrbkuts8mgkU0BTojLIctZYROr/ngjCOTvugA2SNSav49TLOas+i2xJuHeeBpokeAmngw2IwBE
	pf/Kqwhf5IUYI9Phpnh+XDC2Ge4HgRHshjBiv5LZ5lhesJpdov0/58LRLKs9+wTjKxW7VHhKYd0Dj
	sxQsnm0Gc4/BxePrMdZwl9GOjYQo8ktK6Em7B3GGHMkHyGoTPYoMwSTzTROQHXDust2wKKHv2D8Qx
	iIG2YNj1kgg8VnrhkKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHa5-00000002qM1-3sJo;
	Tue, 04 Mar 2025 02:00:25 +0000
Received: from server54.mybundlepay.com ([207.231.110.219])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHE7-00000002nTB-2OZj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 01:37:44 +0000
Received: from mybundlepay.com (unknown [20.57.137.16])
	by server54.mybundlepay.com (Postfix) with ESMTPSA id 2FDD017DEDA
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Mar 2025 20:32:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mybundlepay.com;
	s=202411; t=1741033948;
	bh=QieX1f1ZpVBpFqEYiQLHTccw08+B74/nkI53Ml21MeU=;
	h=Reply-To:From:To:Subject:Date:From;
	b=uI7YKbzDWh/e81OTtpJirkXYrebrbsUH744T4j8ybnqRkcZ8mmoy70eFkLUgHG8j1
	 nNvB1x6WfXDybsgyoWOU00fUDDCz600GEkiZohfPct58ebZgjwJ79iUhakluCucIAD
	 Dv+TK+0ehrbgatIB+zNIsKyqppN8jkWHOYTC/7brwSTt6deibEOz0ZhcC05SqpIG/a
	 MhqhXlLGqvUL4fLje4nKAL05cE5wZe8cLAOWobjPRC3cqHkasv+fYpPFumnqOfALaJ
	 8puoF60hCcyyC2ddjz//BFvJ5KPmAVcRotp0i1T+u4bGjbr6f6agfQdI102A/6oHGy
	 jxSW+7aN3mqQg==
From: Benjamin Elliot <do-not-reply-us@mybundlepay.com>
To: linux-arm-kernel@lists.infradead.org
Subject: INVESTMENT UPDATE
Date: 03 Mar 2025 20:32:28 +0000
Message-ID: <20250303203228.9E3C83D367A87F76@mybundlepay.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_173743_656142_6E55DDAF 
X-CRM114-Status: UNSURE (   0.77  )
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
Reply-To: belliot.panfinconsulting@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Dear,

I am  Benjamin Elliot. I am a Financial Consultant. My company=20
represent the investment portfolio of a consortium of investors=20
willing and readily available to fund any sustainable project=20
that can yield a reasonable return on investment. What we do is=20
that, we broker discreet financial services for high net=20
individuals/Companies. We connect you to legitimate portfolio=20
financiers that are willing and readily available to divert funds=20
into sustainable and profitable project or business with a=20
reasonable ROI. Do you have any ongoing project or a startup?=20
Please contact me if you are looking for funds to invest in or=20
expand your project or business. We would be happy to work with=20
you.

Look forward to your response.

Best Regards,
Benjamin Elliot - MD
PAN Financial Consultant
Anna Blamansingel 72, Amsterdam 1102ST, Netherlands.

