Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34834606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 22:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CLSQc1zT;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=YfSPKpsy;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Q0s3ifmE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b19ke5R8dsS/XvA79kQkYa638+7V0D45xqSFirGki10=; b=CLSQc1zTJp43mHukl1fpfzzcLr
	rCQtFwYx0oEJbvx4AJNyGKBV5rgyRvhAZSRAPzrL6PYm9ccMpA7NGhaDR3uEgTkZ+J7VCTiWL5ul9
	WIrsvgEYea/SAREuBoLM1Avc8002nbz6MNuJtdAVg9I5CqwapPGBHNfw/A7bXEaUQOu8SiMVcAx7H
	h+dV88W9g0q71iNRJ7Bq8yfXey1zI9AfoCVc0uGvSGVnqPtCcfNcSs9/AZUS7lXHWN/b+uvM+nEJ7
	zg6zBqCOA07gc+Hlup1PW+FiO03boap0mrxf+8N8CPuhTZs3AO/womhh16v37DfVWkWRJHxUrX4fq
	Q1rtC5xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvc8-00000008T7K-1U4V;
	Mon, 19 Oct 2026 22:13:52 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvc5-00000008T6t-3Ds5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 22:13:51 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id D45F3EC016E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 18:13:47 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 19 Oct 2026 18:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792448023;
	 x=1792534423; bh=b19ke5R8dsS/XvA79kQkYa638+7V0D45xqSFirGki10=; b=
	YfSPKpsy28wG3TFLg+0euDTx35bpoCFlYmDe1f+qkBnAzEfRgCd3XIXkxcJbUxBC
	2cUGSEH2YVr+X5z8XhWS8EvfWJPX88VJYz+44BnkpsZLYfGMyPWvoEPa5D4XVmIl
	hFgkWNFdW4HzpkYLj3YrmE0JhpsOPUJw8DAgQN6StDwbPWt3Rgwkko83onEVchcB
	6VnXxoxrLxmebaDFwWbiKbX9OHEV4OV8Lw7dzf3OMs89kUB31JCIuW+RFc+l2xLQ
	FlPRd/WPF0SW1R7Qnn7LKZG/I2+W1nhIbG4lblGRU7T5o/7GZKB7e5m/HXhU0M1P
	5nCOkCR4XhGWfy5DI3zyNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792448023; x=
	1792534423; bh=b19ke5R8dsS/XvA79kQkYa638+7V0D45xqSFirGki10=; b=Q
	0s3ifmE/oHQaPCqKxOocoD1RsfWMsP7ugR1iP+6jABBpIIRFUL2Plvx/CVLue+iz
	sL3TAkJrlcP9uAuoHcE/DYKdzqQCIbEmq9+mrP7CETZXrgriY6VNY2tFEbbtVEW7
	dVh9thar0fQtD2rIz72CLitf6QxH3znNPM5Z+hH6epRrTcPUPGaAmgUeQsTwgAfA
	VOpOBOJzh5qFXb82IT1BEEvSNS0LuMjzCu1Ge+QNabLdR7cWZggYeQ8C/w+Qw/Mw
	9lBaigTeDeyRTSjf0lB5iuRaKLTa/1KTuFgdgXfG+nEQsCff1Q9lWI9FdouX/0Fn
	avrA0W8rcDshRUD/PXM0A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792448023; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:Mp/f3ZJJFRdm8sIzrNFi/UVYtsEtJupuoHHHGONjR3HZgJZ
	FFwGruCjxZRY4L7KyQtDoeOUZjmBX6mzSozpEeWtKiajLwizPsIqA9aOXINorWcB
	vv1OH5wogXx3FJ/9w9uB02n4/By/pwfbmU0njusX+kS/Xq7wd7WUj1eIORBKWp7B
	QjfUil4Jf6XWijp9rnSa4ncJl/YX0EENxYmTCiS41Fyjtf1XCkVupcqI5Vf38w8i
	jmYB0pkhp5aUCs0mYmPVtxRtxeCMHmAHPb9tYzQeH25+1hRUX8uE90cWYfEHu/eZ
	otmKO4NOqN+nmeeMdJ0kshimdihCxZT8obyrFKA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:PMbO2eFK/HngZyDJy5oViV6VfKYFsxy7XE6yeZaEFog=:xrd6C177KUzqVuW8T74lgPOXnZyd81HS2CteGq44Y2w=;
X-ME-Sender: <xms:EpbWavz21F8CPXkV9s1zVBW5cctnPSTHwVquOeXHgQYx2HPc9xU-Ow>
    <xme:EpbWaiFlcjdTdTUORFb6JweVGllk4uKi1JmxD7qiQ7gzgBDP9mkXQJMTOPaorXpbb
    TrokS-B5G1dlIe3HY2SXT3eaiFMJP02rssP6JSMy7h83rcQMzNHclo>
X-ME-Proxy-Cause: dmFkZTFqEN6muZMP935NXiz6bee41DbPaDd3QKT7ALIBuCjhUqNg6fjgGeljhBZXjYGp8J
    J3MqyqGWNLoJaIvhncl8GHxQDbt7zaEwqLtI1LllcSEZ/6WS9gLFbrveIe+jvsEeH4oOxG
    eSzuZDyopzds7gyUF3K7ozIa/9o4Yb6M7SouyW/tR5X39yUj+kSFZEvBhT/hZWAmTvhA8J
    bp7pUhzNma+oDlvkSAUSxoC14+8TtrpvwpcaYTDNZ0CbxZGtjKQFwmhtp7vRELtKGLYdlh
    +fq0Wh2JzLhiVuR6BtAh/SrSPS//ZopfKmXaV+Pa5sfOf8KILTU4E2sH+MQTi+6zRf9UX6
    fmxZfNCMdDhe7xPGhjH/TdHnWg1xdqXFYOMbxAQPhc213Wpfb934S/po9g7FL0qCUUM9Zj
    VVJ31SxqMY9cVAFqBJ12CEL6RFvOjAqsrOuuVAvVm4fwVWcJeopiJQ/z4XxTiJSG9Er9Dz
    Tc9Mcxartx9TD2qs4Hbro/EK9AaSqKKOoKObOLPsbizjQjt10M4aRhQ59gaO13LSUNiJQG
    MfrUwvSlb7n8DYHb7BuvOiIXl15ugTDiEjfbfc+RX83RyuZbjI0OHodm73zMAQH6bnscJ5
    D5fEfFtAZMkwywpvwDeo7mYGryOY/Jg4jvQqJLympfdZd4ObYkhzZ9kYGNkg
X-ME-Proxy: <xmx:FJbWap5k8bN2SMBFs8IdvVOmrBhxJwVOkCHk8r38rkqGehsJY6SSbg>
    <xmx:FJbWan1JDoBolQinX_DgW37FZjMPS6eTarhhjuM34GOs9pccLEL2xw>
    <xmx:FJbWagyeBGA1OoGG-Oec87-zJpvl3W04nbVrvQ0pBqF2H2mU4p489w>
    <xmx:FJbWagndh9BgCbQ0J_iDF8Z_11WZj1UJw0sns5uRTX6BX6-0FyRRhw>
    <xmx:F5bWaptmWhiXVi-ZrWLqf8jmrWtrODkpFDkK9Y1HlXrb1hii7Pw1E5dx>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0ECF532A008F; Mon, 19 Oct 2026 18:13:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: ATLhSvAouVZo
Date: Tue, 20 Oct 2026 00:12:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ian Rogers" <irogers@google.com>, "Thomas Gleixner" <tglx@kernel.org>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Stefan Kerkmann" <s.kerkmann@pengutronix.de>,
 "Marc Kleine-Budde" <mkl@pengutronix.de>,
 "Christophe Leroy" <chleroy@kernel.org>
Cc: "David Laight" <david.laight.linux@gmail.com>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>,
 "Namhyung Kim" <namhyung@kernel.org>, "Eric Biggers" <ebiggers@google.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <31fe09f6-0a14-40fc-8ad8-c03998fb1f5c@app.fastmail.com>
In-Reply-To: <20261019201257.3805356-1-irogers@google.com>
References: <20261019201257.3805356-1-irogers@google.com>
Subject: Re: [PATCH v1 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option for ARMv5
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_151349_904507_8DA1CEF8 
X-CRM114-Status: GOOD (  10.82  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026, at 22:12, Ian Rogers wrote:
> +
> +config VDSO_UNALIGNED_PACKED
> +	bool
> +	default CPU_32v5
> +	help
> +	  Use packed structs rather than memcpy() in include/vdso/unaligned.h
> +	  for unaligned memory accesses. Enabled on ARMv5 where GCC may emit
> +	  out-of-line memcpy() calls instead of inlining byte accesses.

As explained, I think this misrepresents the problem as Arm specific and
isn't the correct method for -munaligned-access targets on Arm, which
include CPU_32v3, CPU_32v4 and CPU_32v4T along with CPU_32v5.

I still hope we can use a version that just produces the intended code
on both -munaligned-access and -mno-unaligned-access targets like the
old version did.

     Arnd

