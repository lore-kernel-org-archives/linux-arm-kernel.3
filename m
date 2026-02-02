Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D768D172CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 07:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWsy0gJ/yVJSv34AofHi/+W85hyUn1fqDnXP+KPI4Qw=; b=2FTScXKPMWn9xXLcxHaw/C3GDV
	zAxK9lbpT9GjemciSvWjtyJdeD4pC5MmwoI5ykK38UCVzgpoYnyZr90TyjIQOAqQyu9zaMc97MWGF
	wmBtK3uTooLxz6mCvkpw08CO5O1Z5uvz4LIU+YUqYrZFiKSuAyR1Xkk9Ou0gG770ymOp2iGKZExbC
	NT8guhZda3AD/PTB/L1nQN/82wE8c1Hi9NfPf5VFOrhReMJgtSf6zkUkiNH8SuT4wEIneJCbKj2/Y
	bD2pP9Xs+/AkR7XTQhrAqd39Pr4u+vKXP6kKujkkIxIY5q3EiKCShusMyN4As3W4kiDyOKgxvBXDP
	rpDZUuJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmoCt-00000004aZ5-3Frb;
	Mon, 02 Feb 2026 07:18:47 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmoCp-00000004aYd-3WCX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 07:18:45 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id AFA171D00128;
	Mon,  2 Feb 2026 02:18:39 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 02 Feb 2026 02:18:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770016719;
	 x=1770103119; bh=bWsy0gJ/yVJSv34AofHi/+W85hyUn1fqDnXP+KPI4Qw=; b=
	iFc7uaIW+B5Gf/WlCx22+CwbiPmyegRYiOTd0j2iA+4FeDfQMQ1h+oPVCWwmvaZe
	edZ8w6iYGFfAWAIKkT5769Mcj6cCrJAFEhIVVSSMYxjhZGRVLTJIzXfsp6Y9V6/N
	ftkta/zG2fo0Pu0fQ+g+V61XQgL/mNRwPG7AK6LQQaltL8+muWncoQ69w3QtCJ77
	iZ10NXSEEtlnnqttmjapzFOXVLOHRet0MJo39Pl/YFIBa5ExsEpnPrSDomxkUIc2
	GLgeKGDqaBukJXcLzoYZdK2rnN6MsYeeULPgmODeSVRFmuxSqC8ZTmc5iq0BjXuv
	RYR7xz1zvUyTCmGQxhaQ2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770016719; x=
	1770103119; bh=bWsy0gJ/yVJSv34AofHi/+W85hyUn1fqDnXP+KPI4Qw=; b=n
	yUyY6ZDSljIKTnmw1AU7GZoQKxryxhRIYeKut79PY6EpIo4dDmcCJTDmL340FEZM
	arnUpQYsf8NpWiQdaoK/znZjuzEbzTrtoTM57NOcsefIe6jLTa79aAwcH+Q26dlA
	kfrm4l24S1y+cOEOoH0md3ANgPi3jEkE5dFUFMo1MkOQVFcLoGj+6GsxJF6sUTq9
	goJo4HdQhI+/JOxlKoCTfAdWi0LkcOhpT0GzCfevMLZm6YR64q9tlNyYQ8MZFU9H
	KsUfWwvv/hJzF5Luln98WEXrNb9R61/ArKAuWOWurR6v5QYx82r94SuL3nDvf1ts
	Cki+HJgGyLXC/AJxulmRg==
X-ME-Sender: <xms:z0-AaaHuchIU3x5nSYIc-VVd6NdUr6Sbg1mqzflOOiG45yc58l224A>
    <xme:z0-AaWIUT5PETf_ixhI7pLkCh_EMtEuyrj5_BIowj94zNOGsEMpG5t2SrC2TJTYpY
    BttaUK1ejqs6QdqVN3Iirlei4OKwO_YLBkSxHmvfBbkgKp0HFmJxT6->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeejtddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfeekleevtdfgueeggfdvveevueekveffgfekkefhudektdekjefhveevffffffei
    necuffhomhgrihhnpehprhhotgdrshgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthht
    ohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrg
    hrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepuggvvhdrjhgrihhnsegrrhhmrdgt
    ohhmpdhrtghpthhtoheprhihrghnrdhrohgsvghrthhssegrrhhmrdgtohhmpdhrtghpth
    htoheptghlsehgvghnthifohdrohhrghdprhgtphhtthhopegrrhgusgeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhopegrkhhpmheslhhinhhu
    gidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkh
    gvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:z0-AaX2CsiNZEGqiJkZnfP90VJxgixWG276SLu_N5kWWJRCsWK7CyQ>
    <xmx:z0-AaQfyrsxpWwmmlbfaYy5V_XbNWjZMWV2EB9PbxyjJoaKZvcMACw>
    <xmx:z0-AaeD2KTFzSggUELf464ZDsBWaAFBTHhNkzqYZKmlA4aFN9V-9Rg>
    <xmx:z0-AaX-BkpRqiZ7558uXDlWhF5bR10gTJ8mNz31aGjZbNtYJlmIaMQ>
    <xmx:z0-AaQ209crPTfm-OURqy6SS8zvLO4mc_NKjMYyRXBStbay593PPsFAC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E923270006A; Mon,  2 Feb 2026 02:18:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ASnEhGskTYsw
Date: Mon, 02 Feb 2026 08:18:17 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yang Shi" <yang@os.amperecomputing.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Ryan Roberts" <ryan.roberts@arm.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "David Hildenbrand" <david@redhat.com>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Dev Jain" <dev.jain@arm.com>,
 scott@os.amperecomputing.com, "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Message-Id: <fd18c462-60ce-4dc1-9877-2a1d162d5879@app.fastmail.com>
In-Reply-To: <20250917190323.3828347-5-yang@os.amperecomputing.com>
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <20250917190323.3828347-5-yang@os.amperecomputing.com>
Subject: Re: [PATCH v8 4/5] arm64: mm: split linear mapping if BBML2 unsupported on
 secondary CPUs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_231844_405853_60B5A27A 
X-CRM114-Status: UNSURE (   8.77  )
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

On Wed, Sep 17, 2025, at 21:02, Yang Shi wrote:

> +	.pushsection ".idmap.text", "a"
> +SYM_TYPED_FUNC_START(wait_linear_map_split_to_ptes)
> +	/* Must be same registers as in idmap_kpti_install_ng_mappings */
> +	swapper_ttb	.req	x3
> +	flag_ptr	.req	x4
> +
> +	mrs     swapper_ttb, ttbr1_el1
> +	adr_l   flag_ptr, idmap_kpti_bbml2_flag
> +	__idmap_cpu_set_reserved_ttbr1 x16, x17

I'm getting build failures here, using CONFIG_CFI using clang-21:

ld.lld-21: error: undefined symbol: __kcfi_typeid_wait_linear_map_split_to_ptes
>>> referenced by arch/arm64/mm/proc.o:(.idmap.text+0x298) in archive vmlinux.a

I can get it to build by using plain SYM_FUNC_START() instead of
SYM_TYPED_FUNC_START(), but I have no idea if that makes any sense:

--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -439,7 +439,7 @@ SYM_FUNC_END(idmap_kpti_install_ng_mappings)
 #endif
 
        .pushsection ".idmap.text", "a"
-SYM_TYPED_FUNC_START(wait_linear_map_split_to_ptes)
+SYM_FUNC_START(wait_linear_map_split_to_ptes)
        /* Must be same registers as in idmap_kpti_install_ng_mappings */
        swapper_ttb     .req    x3
        flag_ptr        .req    x4

      Arnd

