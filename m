Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72260CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 21:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zevCk6HADjWKObcatFxpYNNeyJpHnk8AZJwqLeDeBMQ=; b=fAilygNqqWMd6K/UoXUxXOwMxl
	RzP4QH216roofmMz2IMOsZIT0HlDFKNR3FpPqR2WMnvnBYeO+mm4mIO7xDELFrnMuFW4BK7MfNESW
	VWlMB6L/e9zrFM5XzE8Hcox9ZyBq6os/jUEePQiZJE6pTw/u24AXhmhuJg0JGD5zjfdducbifYYxN
	pBh8V/C+nreOd78nH/8LZmaJik1xxFvoqKlLrKQDkcOn5pZFq/mABvBJp62KbpGm2lLiPjfrSUtZT
	k5vSBKhzobdWVnav3SmgwVtOh97moje8yJ2BM1nzfMCNf9wgxVt1/ooGc5EX4rm0RlhTxe/4bUBg9
	h1nuKvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCkx2-0000000CXei-35GS;
	Fri, 02 Oct 2026 21:37:58 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCkwz-0000000CXeI-2G8M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 21:37:54 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id A4E74EC0353
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 17:37:48 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 02 Oct 2026 17:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790977066;
	 x=1791063466; bh=zevCk6HADjWKObcatFxpYNNeyJpHnk8AZJwqLeDeBMQ=; b=
	lfmeDlcR6pQiomPnBTJgvw+ZKUzYS2NeaUKFc40ime5BmsRDuu27LYRMlu4lcyx0
	pjX0guxXP1+hXHJQXToFkO8vjQNN0eud55o+Uf5u4cb85RMzbB/kcEv22GdbOSEm
	9Q3KcJyyQreHl7Dn+lkExl8NVxlA0uPNK8IQxxEe0FDCZcY3Sr/BIs3plP7vmpDR
	OfOFRMFWbhrvDv3L83ivo9we/qcSCKtoYfyt21NkHDB5mv+AE4s/mdD5aZT9w0ET
	iE7wBUHidhRspmWSVic6hyOncCU1+SRFXJ2wfsA7nbkrE/Mcmu3BGg0QD3phduvF
	DWA1XxaYNVv2tLiFBeQQpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790977066; x=
	1791063466; bh=zevCk6HADjWKObcatFxpYNNeyJpHnk8AZJwqLeDeBMQ=; b=Q
	uKe43pNnfnoIw9JVplJ5XbaQlj/ttQmHF9mUgftCOhE43ZL1jOWcP47S+LbvXOE7
	Sf/cGW976fVNDpHi0zkaLFHr3t2xQtCNaKQSRPivLmo1htckS4I42aUnk3qrcHQT
	oF/RzXmJUg/NOuarLSXnBtgAwJsRyA1qkL4+4ZyTDtic65/2FD5jXiuIO8CZp2oF
	2yKMqdZr8Bj6n4SGdSmE+Abe1CTxtWZWsRcSF7gBp+gsI/QBSOAQOeYeAZvo4w3l
	kobReFWd/9zsKwcUQ1C45Nlvtlzn7GDsta/N2dFbaS+EbXQm1WRnK/zMmx3Eb8eq
	erj8CBYtrpDCznVMw9FNg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790977066; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:LpndOgUbhsOQ0KM/Jg1yxY77hN8DnhPCidb1B/hQ/qyjGcE
	BZ+oMUvXwisv3NUe3firalJ4cBq+KKamUY52Fi8/ebUsxww6wX3jze6Fh/Yfnb7u
	0Im0qWpWUuQEbhY0M43rXi4UQux6BoySVYRWN5jq5NqcuE9Wmqp4Rst4Nn3NWCYW
	zTu1mFpjs3I7/LUUOD54HOK646qYcqAXxj+dgiPKAW/CheOFWAteIGgzL6zXjjX/
	RWrTghAfGhjMVXWbWaBj3qppouRGOl/DrftDXfzqdjaaCDDFLK5hyOMOc2AlwlMA
	x/s0JLANlwoL01vE9pl+ABIpzYO9VNVbOB9IPRw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:t0VYZ2kk2MbfX0XbY5mtiCu25PX+gIW2dbAKI6Ibm3E=:L5kRDBGbJEWLFniVA5klUp6KVl585P/vFsELwXj8O0c=;
X-ME-Sender: <xms:JiTAasgCD0rqaAZ-30bC0ML--mDPmFYvB3OZPzob_jKBpklBk9rS6g>
    <xme:JiTAav2y0uBj_MyyUxDkOQBdiDGnH8y_Tu88pJquh6S70LenC6sdkNj7sHWLuPH1N
    Ez1ev0m7_E_hER6i-z_T9sfoK5mD5PJaj60c7wRnZp3RLN1Kfdru-0>
X-ME-Proxy-Cause: dmFkZTGqXiRZXfmHJ61JP0i8qg/CxGQKFD2bFQRKvgHTM5Zfuy1hHnTCGEcoYs/dOJJcQG
    Ynic4rG11iYNagoe/MkkGcyoChlJQvAJ0GK+2g6w7QBfE/dixaVfkIVnQ50kci1R4HzbTo
    KRcAMGR4PJKcwoNXl34ZNY4Uswj8rmlUfnY6CvwKw1j1j/FfdwvKJ1jK7nEZFCCa59IgpR
    4tFPFbsXgbq1tBMKKGXhai7PUB/D9Qbyu8+N7T9q+ZEIC1rUPmFGbkLdnYcO835JF1xbgk
    GJLhUdHHfMiYYtkGOcTdMFZRG5Aw8lVdnXOnz4rHkllAhuyxXt3KGuvlFE9wEqzKGzpHK2
    PuNm6p5gDgeAvPsLYdTJydjGr7rLb0TrBSrNS56kFxbtpa8KgWyzYZfacOsrZaJbBuFkL3
    aVh2c5k7muAbuan8lZY8FXRvvK3OsE0a8LcPXCgRLJIv/rlGCJmBCiy6Rs2BRJFa14QN0+
    q+ghJNB+2mPhjsIC5QQdU/hh6cl8tXVvuqD8IGN3n3YIqZtIx1Ha+Ljj3IDJ8tWr0A/SNx
    B39WKDfT67jCmsS+AhTTUOYgCU+qQDmYBja7URRNo/aRwocR/rFzfsCpgCbqIUWPTt/MEd
    2A47tv4hW6Rrs1ufagdFPZEQ1+n7YrzPSBJasQQovcKxf8WxpUHEJwi+OLPw
X-ME-Proxy: <xmx:KCTAatGcdtwTTpiO0Q3xR8LjkpHSYWpjCJ_yspd2QPUiNelaOrYURw>
    <xmx:KCTAakmP3jwWXM4xR0IajFWRnmRt1ItvaqHZQ8NJRS7BZGvMHFUHNQ>
    <xmx:KCTAahZ0DjBOPy81v3KDX9fxfcyN9Hb6i7cKylNYvwgs24O8eu75bQ>
    <xmx:KCTAapGfahl5SZ8E4AIFpWLdbI5oI3ukUYiFyZYY5isQ0SaVe0164w>
    <xmx:KiTAalGJ66fJRTNQ5CVGxIroP08lXXXOYMJzieLz9d9lekt8qmnp9f1q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 9E86032A008A; Fri,  2 Oct 2026 17:37:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AD7zrW3c8eHJ
Date: Fri, 02 Oct 2026 23:37:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bjorn Andersson" <andersson@kernel.org>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Sumit Garg" <sumit.garg@oss.qualcomm.com>
Message-Id: <04be768e-7c38-4ca6-a721-d716947b8708@app.fastmail.com>
In-Reply-To: <20260922130653.357615-1-andersson@kernel.org>
References: <20260922130653.357615-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm driver fixes for v7.3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_143753_673764_86ED23CC 
X-CRM114-Status: GOOD (  12.15  )
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

On Tue, Sep 22, 2026, at 15:06, Bjorn Andersson wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> ----------------------------------------------------------------
> Qualcomm driver fixes for v7.3
>
> All clients was migrated from the Qualcomm SCM PAS API to the Qualcomm
> PAS API in v7.3, remove the now unused direct API.
>
> ----------------------------------------------------------------
> Sumit Garg (1):
>       firmware: qcom_scm: Remove SCM PAS wrappers

Hi Bjorn and Sumit,

I was running a little behind on the fixes merges, sorry about that.

As it's getting a little late for 7.3, I would suggest skipping this
one patch as it is a bit large and is a cleanup rather than a fix.

I would instead merge this directly for 7.4 but still take the other
ones for 7.3. Let me know if there is some reason I missed why this
needs to be in 7.3 after all.

       Arnd

