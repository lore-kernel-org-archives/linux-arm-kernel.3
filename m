Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB2E606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VitRmV6V;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BbRKEmUh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MqQV/dsEorHfngHDYCU99fh+ThoxmEOXgM8t5VST9dw=; b=VitRmV6VivEP99
	A9pDlgPjIenaoZdXka3qFnZxgMvTFIIWK9Xa1hCm8Ki3ZH5K9hIlYUcSWofaD5cnUZqEMK7nX+pn0
	S28Aj60abf3A/fVQSUmv94YUBqPwapMzRaUmqA7lT0SQvx1YzvFsgFeMrDxY4pHbfOBbAuExxeEm8
	OKoheUdvJnrs+O4NjLnF6CtLwqVPDJ3BPJge2EWKrYWaBaUgj9sMNxOo128eqf0Eh5fRXzM6pLPaM
	39SGISxAIRegH4HeU34rv6oxPwHEAjCNL8ee7pdrxFHcuZtJnHsZmbXTMTxESSunAauExq4zshlSU
	cxIHAoFatBh+rYJ3iKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAvJ-00000001lUw-3YjP;
	Tue, 03 Nov 2026 09:35:21 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAvD-00000001lUX-1C4A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:35:20 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-33bb5afa736so525515eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 01:35:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793698514; cv=none;
        d=google.com; s=arc-20260327;
        b=lQrudczqjqqSi30wyoMv9kseno57ig2AzkdbwGKnLXGhG0lwtRw/16DcHdmhuBdTxU
         lHtaKY+ipBzZBDg0H9ZKKQHt4WzGwynk+jCjhugwqCVpPdw1uceeJ9zyuBIDOD2z6oWk
         7GMR3HixudP9Fw8TbFt1ErnPyiDjQZwCckPC3B5jvv73SEXcfw1bzmkPBO0RCzKytsFj
         MN16J6v00pQHVmDJX2s9ak+tbwkkbwtOsCA/iWKa0EWMqUs2Y1nZSmGTpMCA6gi/UIy+
         +LkyuiDa6q8J1nG/9Fs39ZwKjEN7uQ/6DF2VVCWxDNnF6PPY/fj/F7WwNCMZRJmVc6NR
         FVXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MqQV/dsEorHfngHDYCU99fh+ThoxmEOXgM8t5VST9dw=;
        fh=IstLeagr/NVLpyh/KAPf5wQtcSF9yZGJBZEnq28G9uA=;
        b=F/9ta6WcBhzkqzBcqVuNxAfzAvmfuscxz5yNO+27scZQVEIXbmrGHvJZGXCVqldzgQ
         Ic/F8vawaePO/tCJPHfRvG7B2mOGikTKyc/ODK+54jvYXaM4bRW4qYBTLprH4KIz9llt
         Eai/hcyQyRqQmxIa8Cpa/4Kd3/TVuNJq7ALoDZK7OM/MD9nt07eZSOieFwZWCOy1DBfa
         2RdBjL0tfs1HIYM0f4wlt6EK5L6pQd0qglpkfLGoRWNMlFQW9OMymCXFcMRZRRI9dbaM
         SQ6E9znqOSGVV/v7CWis9lovpaosB2WaLWpdDj0iuoZhP/xAQMBzGiTJhI8XzGh8Q7Qb
         I6vA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793698514; x=1794303314; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MqQV/dsEorHfngHDYCU99fh+ThoxmEOXgM8t5VST9dw=;
        b=BbRKEmUhWL0ekYhgPAZ6foSldO5h2lv2VWmoUxmKO4ODkd2Dxx8gmC4artCbcdfsQA
         doC084mn2B211bFC8Lv9i7/aaeKJ1NohUzut3UKit0DS4zFL8VTKjC96mEALqRuBPN71
         FEYrWVFDlI2Ci3m3E30nTolvSPlyzKp88I5d4zNisX7Ma3uvuoXbLNsI/WGD/Mpkmsz3
         8RATFtL88Yayml4YwGBFbcreFqDMWJ00EV/nWDaFDXBYY09XUNrbSW3Azyb6/NOQ5yn2
         2LURDywAJT/G3RUwLLlw1gqfJHst/qddH/LjtgbUgj+k6r103KRfzC848o0le5SbnVuY
         QheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698514; x=1794303314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqQV/dsEorHfngHDYCU99fh+ThoxmEOXgM8t5VST9dw=;
        b=nfnOkzvYOQ5QQUO7JZLA4Ad6mj4uRwyKigg/bC2VacjsOiH+eo5k+QVbw4C//AIgsW
         yNW+2Vo5wMUDN/n/yUKc/xUYR93chpiZXoUeTkvW4i+LzRjJbuxPxodiRLhFKr2r584Q
         NfasRHTdeyqUjkyrC97j/NIWD0fqoM9NgNqYA5Dp4aRSwwqw4TfyTMPNERwmKcCH0FxI
         coXhdlI9/Ly2M8wfIXGsDTNTzR607+wsys2chxqUYZ0GqZUfOX1q6PTl7g1++eOZthV1
         c+8ssO9f+tYMOyT/TnCSZIskiGQGLxW2w3BhOzZDMzlqx+JVU9KLoCjcTRRMkja1pWCb
         nIIw==
X-Forwarded-Encrypted: i=1; AKwUvBwZC/jWAabPVQ9IysZDLnNjRNH5w7EotX1lM4GtsKX4rkWZAPCHYDHbPjpbcHVDWXwcVNjMXgrI4gpKxm3ZjT4w@lists.infradead.org
X-Gm-Message-State: APuU4Z+FgFXsNTmfTEUE+dQFh81xhDXQ1ufppHgyIJVusVdc1Dm5ASbg
	GHGLUQfDJU/BeeULkzmCXCiHcRuFJtQg459t07OHg+v65867K4dRd9rLCzRZi5yK5d115Dyj1XV
	ItKmV3P/YyIKBYG5HE+ddjwHTtddap2M=
X-Gm-Gg: AYBFou0XFwfyDJz07btfAQU1zYmSE1nbZ2R4PQUJFESyFmMT6fLW/Ss0427oMPnyBI8
	emZVeKOz+RKzHv4jKyQ/fc+IYqXVrh2+lzDKniJ9QalGjONpy2UgqkvgG/hQFP/LdJJun8F7/FA
	2Thgzo6w1aJk+cwChP/9ciZxXFC35bYO54N1cyfp1yckicZqa9N47rcUJ2KFooZAF78PlNqnVbZ
	MfVenAyqcnXTZTvMvkWDA7mxTqxvm60v7TuPUdp4TwF+41xnfLqbzKDk7PJY3HMUQ63mu2dSs5P
	Cppn+J9Fev2Cw3DZOZfUF3NamoAuOQGgbycXtFOsFv5mL2GXcCEZznrKBgnW+ZZ5fM8jqM/l1Vw
	Gs2zdMJI2Lfq2s2W+3ilk47BjxGC8ZtK/ZC3cV+BEaLjwm1BUWIJXgIVeXF6O7lzF0VMBbcMjus
	Gw451TWI0SplxtSqi2I5fPsZq3/OtLLsgBs1tQclRzwvYVwFJMSeDACsHz4XEH0rVqcqEQh3o/z
	CiAzt73/fS7tq1GtZQGGGhOcBKsTrQKQ1Fv
X-Received: by 2002:a05:7300:7a9f:b0:36a:143d:98db with SMTP id
 5a478bee46e88-36a4234fc7fmr27905252eec.1.1793698513831; Tue, 03 Nov 2026
 01:35:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261009124124.1176706-1-tomo@flapping.org> <20261103.182511.1470121559944018656.tomo@flapping.org>
In-Reply-To: <20261103.182511.1470121559944018656.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 10:34:59 +0100
X-Gm-Features: AclHuK8BV1waRmFXx_MF81hHdz6lT065iynp_Uw6trJe76whSB8KZg68Mak_W9E
Message-ID: <CANiq72=Mb7Vn9O0baOJFRf68UiZoxK0RjdXBFLw_hCHcqCkZ_g@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: rust: Generate unwind tables for Rust code with ARM_UNWIND
To: FUJITA Tomonori <tomo@flapping.org>
Cc: linux@armlinux.org.uk, ojeda@kernel.org, ardb@kernel.org, 
	chrisi.schrefl@gmail.com, linux-arm-kernel@lists.infradead.org, 
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org, 
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com, 
	Rudraksha Gupta <guptarud@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_013515_329471_C14922E0 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 10:25=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> Gentle ping. The patch still applies cleanly on top of v7.4-rc1.
>
> Which tree should this go through?

I guess arm's ideally, but I am happy to take it with their OK (do you
want this Cc: stable@?)

A review/test by Christian would be nice. Rudraksha may want to test too (C=
c'd).

Thanks!

Cheers,
Miguel

