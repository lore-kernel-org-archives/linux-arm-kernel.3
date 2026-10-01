Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C599CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uwp2ZDOoPY3tI2VNi4uZ1TmL4tpZAymbe2XPjfSWC3g=; b=s2nh331VSqgRcpi11RzdJa8NFO
	q6EUaPbPrUvXkJkEkYEkjZkn682Ph1oMxymiu4WwG4g+JdkKJVzlmM9/L2mXBLJVItGZK/xM5FI5y
	tE/Xms1WITWckvZG9zMMtXpfW8RkVh3TYkDVIyK0bouUfl9J82K1BCKikWqtHCtVEdCFTCCa2+ClX
	Q6gFEctT6h9dUzIwESfP5Juk3B2uWC6oBzXL9IBoQbxfoPQvyvmHzD3PzH1CdVe6C/VdLS30SUtYN
	iT0whT0S3JMFUbc7b/4Hwag1wf3/C6q8zt+kKezTy7irLyxugAwClQ1D2KDQMWcXK4LEmY5C9a03+
	YZvi55iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCH16-00000009G6I-2ZOo;
	Thu, 01 Oct 2026 13:40:08 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCH13-00000009G5k-3cBC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:40:07 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id C2506EC01CD
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 09:40:04 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 01 Oct 2026 09:40:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790861991;
	 x=1790948391; bh=Uwp2ZDOoPY3tI2VNi4uZ1TmL4tpZAymbe2XPjfSWC3g=; b=
	Vvo60XYFrWy2XPdLwFA9adRkgSN3UVtkoS97ON0g2cGLCnP/r70JvNVCKk02dTpg
	VDO1wr+/WyiNuQcycIM88DErSPgqbuSU94W8y016zNYI446AuE+uTIftFoiNdWAu
	FmvLnI1iVuzLIHxP+h5qSkg5dckZO8Nm+09yWalyTUwYhdEIULLSaf49/9ozGQVZ
	sFcs+noqoxMH57+7ZYpSBQZ0lLPFqII3mpuy1wp6t5FXcrKaQ4PzCYS5EDoFdjVX
	7PR3k6b2zyNse0qgFebEvb+PQRPXDA8ZQg1bdc1kS+clYqOgRdRJrtxkhy4vxkCH
	2Hnoq6IBtYmhr2ACmlZdbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790861991; x=
	1790948391; bh=Uwp2ZDOoPY3tI2VNi4uZ1TmL4tpZAymbe2XPjfSWC3g=; b=y
	E0Y3aPzlONuyx97IbQDkB4tJwxI4yrGQ0Uh6wjPCIopZN/XwMX7BiVptHeT2n7J4
	JHLSu6Lked9EkPyOzQmskgXlQ39Fa+a8Kc4jWz8ZBDEifiqfcnG3CZBJmc77mUYW
	MDVjwJPSUCXjCOdtDGmo8d75WwK3FXVmYgcrzgHsLNZ+H2fNdkuRJZLrGoxBu1Xl
	rbu7lhXbIOcKaH6AJyuu9qb/gRwNp1lCsolXgizZ+Jlq1EVFaG/nM2ZkkAeDGWf+
	PI55JTlT8JMJjNyz7zWPecjxOzglND4gkkRFqQ2nxceOh7z+53xrU5Bi5v9aQdMi
	gQm+O2J6WY1RlD8L2adRA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790861991; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:ntQDvrNp2ehxsEx/ZNvNULcjNOxQ43uqC5Zaiz50TjbTUih
	/Luae2OilE93tp+Kot/KcR9HzJjh8wURS9/mO2E89jOFwXrq9KHEpRoMJEK9ywR5
	O5pVR/nU9MPFkwF9oI7z4s2/HPQQpuHiDEGHLJ71fMbWIgaYKXJmIHWVme8jgNoX
	eYdK1GPzKNRk/y1L3h/1kXskb02/PX34bNHH3JbhYfIyaeMjVrKYuPks4F6C5Ivq
	gKnMBi8ssMp477Gh0TAzpeQGMoQmRJfhbxMHYshsfu0t3LzvogKxHi26alvam6v7
	7UUcXRUF17B77cUw0yMcwcDZz3zjYxI+93/Sz8w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:BGpLFMCduRgTg7y1aJr8Ihh10vNT6FWHgqI8rrxK5fI=:44EZaq4IayZwFnSEKr7sAoYn1kVxome40EQ9XQHbL/E=;
X-ME-Sender: <xms:oGK-aqKqS5O8pEqGgKCvh__LvsScmCIsvi5uWnyQVKCo8Zk4lQQwIQ>
    <xme:oGK-as8GbFf_iRvMnim8wlA19YZROZHMvzVXmocivAHkXrM_d6iXEiGBw6qXEAu1S
    fE61CGw6T95gOkCwEXVs_MLfrviBAyYn5mk8p9PXCqMwpUGceO2MWTO>
X-ME-Proxy-Cause: dmFkZTEdx5AqovL1MTEo9qQdIf1UspZIhV2/zxzYRmwyd+bfaXPeYA2sFWVvA4rtnWQssz
    e/2T3RJgnanif0LUm5IZ4ZAoV5grcdZq8G0huQxY29Y8wRoYp009HNfv+KgK5P0w8gmFDz
    vuFpNcewv5coXrOM/gbTVyOCjoacUGWKLvFYxLZoD9S9vDqeLMeRitS9iJywkISeFaDiOG
    9HH2239doQyc+FRdEt6Dz45AR1v0pEqiNZCMXnPubcaWeWH/WeBdO1NtWDppw33wUpE9ib
    hFCl0FzAh+BwPd/iWfy1e3RgasoKugqSILaqPXGOHF4i0TS2V6y7Ghsg/2kzdADRJ67tFk
    sAomxwNvOZE3Xl4f/XP3A66f9+z9gspYtzZhE4n76yksZa22YcktB2kJwt0AKSyvWKqBnW
    uThVg1YEV1xUtXdeifE7P+vxCE6CDd5LJ/7+dXXv+Yf4HAaKsl9TzqphOh6uZSnAtXOjHe
    kjhUwVDtlG2ldd0RYCQAAvdnkapM11UMiRGoBcZgec6rtl/YDvWJHkkF8HXPtm6zq/s32M
    RM32kc482Ehq7OcsYWXwZvkFARvGyQVFMaMyJSLOcZsQHNLk6CBbaSwOB+baaHKM2a09ih
    NBkhZ1o7/ENmZlRpShwI8nt1Qe3hGLG5Hb6dsqZU2wuIFvmIxC7QFcNP0u3Q
X-ME-Proxy: <xmx:pWK-ak-68vXD1ePX4y31qlVBoKs_NqqSxrJHMUKlKasmB4u1PJxesw>
    <xmx:pWK-agA8IgXnKSdK4QKof0d01XAqAbnMT9DOVIKV8plUbRPRL6zAmQ>
    <xmx:pWK-auE1s0-gtqaMocgsUVh5dhVkU53_2Of23DTTKtkiFQiexqfdvg>
    <xmx:pWK-aq1g8e83K9bz6wyRWDXEDrfkLCMGvfwelPYVnOiv_WIGGc2O2w>
    <xmx:p2K-ar_Hipd_0Tf2XNyz7_3JwgUuiODDRV-TrdSqE9bmmYkIE4Xc8zHN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 8214032A008A; Thu,  1 Oct 2026 09:39:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AompHzTHtn-7
Date: Thu, 01 Oct 2026 15:39:24 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Steffen Eiden" <seiden@linux.ibm.com>, "Marc Zyngier" <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Andreas Grapentin" <gra@linux.ibm.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Claudio Imbrenda" <imbrenda@linux.ibm.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Friedrich Welter" <fritz@linux.ibm.com>,
 "Gautam Gala" <ggala@linux.ibm.com>,
 "Hariharan Mari" <hari55@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Hendrik Brueckner" <brueckner@linux.ibm.com>,
 "Ilya Leoshkevich" <iii@linux.ibm.com>,
 "Janosch Frank" <frankja@linux.ibm.com>,
 "Joey Gouly" <joey.gouly@arm.com>, "Nico Boehr" <nrb@linux.ibm.com>,
 "Nina Schoetterl-Glausch" <oss@nina.schoetterlglausch.eu>,
 "Oliver Upton" <oupton@kernel.org>,
 "Paolo Bonzini" <pbonzini@redhat.com>,
 "Sean Christopherson" <seanjc@google.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Ulrich Weigand" <Ulrich.Weigand@de.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>, "Will Deacon" <will@kernel.org>,
 "Zenghui Yu" <yuzenghui@huawei.com>,
 "Fuad Tabba" <fuad.tabba@linux.dev>
Message-Id: <40dd808c-bddf-4a7a-be81-53c64de2707d@app.fastmail.com>
In-Reply-To: <20261001132715.108643-A-seiden@linux.ibm.com>
References: <20260930173441.66762-1-seiden@linux.ibm.com>
 <179085262878.3865846.5787241839391727949.b4-ty@b4>
 <20261001132715.108643-A-seiden@linux.ibm.com>
Subject: Re: (subset) [PATCH v9 00/24] KVM: s390: Introduce arm64 KVM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_064005_975097_5EE026C9 
X-CRM114-Status: GOOD (  10.05  )
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

On Thu, Oct 1, 2026, at 15:27, Steffen Eiden wrote:
> On Thu, Oct 01, 2026 at 12:04:51PM +0100, Marc Zyngier wrote:
>
> quick fix: 

Ah, I was about to send the same thing.

> I can send the two fixup patches as a reply here for this tomorrow or 
> later today if you want. 

My build bot is churning away looking for more corner cases.
I initially had the wrong base, but with this one and the other
two I sent, things are starting to look good. I'll keep it
running over night, but if you don't hear from me for any additional
build regressions in the next hour, it's probably fine.

      Arnd

