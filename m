Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31440606B12F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sjWovm+5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C5leY40f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/tD48MGHqLnmAdhTZyJKf923rSTUCONYQJ99Soob3WQ=; b=sjWovm+50/bxth
	owV1XvZ3ieDJ6x8WvE7pDQ+nZwoFENCTo8mgVLzlrcS90+dIJlK+JcFlooj8KIJguHqnP2lHNJMx/
	HPtTTYODSed5Qodew8TLFFZjcZ4KkZwcMgI7b3SADShqiMody2qjFtJVCUKDM5vqtHxVAiFHztk8T
	Mzm3n8BVfYcMKzj79RST65OkPnebw/+yCj1JZPnA04bdozbCm8wOgpxhmSfiEw57M55fJY78293q9
	DzEszRkDjGf2G7sEoZtSIouZprc+6cdHMDDIAE9KRqUL2IL35F7YEnZFP6vVWWVDj+ObSfBfno1+f
	a8qc7mMtOgFtZmz2z3+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCIk-000000028B9-3Hkd;
	Tue, 03 Nov 2026 11:03:38 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCIi-000000028An-3s95
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:03:38 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-36a6ee9c59aso301108eec.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 03:03:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793703816; cv=none;
        d=google.com; s=arc-20260327;
        b=Tr6aZFvDgW/oPbcq67lQogjK4WRJsFUeBPJl+dQ38ejCshnwGU7ZCir4an2G7SlHbx
         z3Iv1VIJUWzTluY9gd8zZ/QB/QMO4QtHVIoqD/rwoJzN+v31ky/2jxbmUFrcq1IcDSjw
         iw2AEfUGdZRmRmHRINaCPWOGdI4fyRM4cBF2XmCmp9urXBTWLFF2eAkNJtM9CEsBUVTx
         w3FL7W9RsyFdR04sW9Km8toquvklt+F0tX/QbPsjzPXJNmttWnl1TP4h/VmJqqbnbVy3
         THTWI9oJizP7dIBYu19NlUruHeN6ItFjV+Cl/jeIr7FPhRRMX0KZAeo83vIF9ADi20VF
         OX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/tD48MGHqLnmAdhTZyJKf923rSTUCONYQJ99Soob3WQ=;
        fh=IopZyWZZHLItT5qXAvQVjt1dbbroctom5OQjDJyyCUk=;
        b=i4Hrg07kLapIwRDvtDJblK86dQETvSmIGAPZcw3QJEzdko/MLERrjUgkHJEQaOIZ15
         Ydq154YqFbF7VONE8KdDp5t8i2KCGLiEo8xOyZTDLqmg43N0CQHoevBj7IaRqJjohfoB
         DHlo8hG/Bx1AOEzTnqXToYv34RXTuRAdmEeylrwR/1FefqIQkb2+4+zrAjPUoEm9Mks1
         dVd/1T1/HGG2YbIf/VGs/JiLRJu1k5BklowPIEQLPO3ppNaHtCvHnGMVibDUWQtiBYSK
         AhwDnTFRR8I2E1FySb+eOB2Ox2xqqlC061xG9ijnYjL5cGeeHoN+Nq5Dl9FvcOPFBy0F
         jVSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703816; x=1794308616; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/tD48MGHqLnmAdhTZyJKf923rSTUCONYQJ99Soob3WQ=;
        b=C5leY40fP/qlNzx2MhywJoDimnijj+Gx/il9TznU6z38XzLKeMZAbQUhDqZb4WKZMl
         xPCWoDOjV7CnGMDI/PZYW9Ue8v6vTV9mtDjQ2nCPWFQVkdozYNjGHrEb2H8xXoYJ8yzI
         ZfD7bUoPmnGegmAS7aXJPuv9g6YNVSfGZORBnJ9/pZEuJfF61/vtX6giZbRSjlHEZZ+o
         6gD/VFD0qGQDMhdqJ4gQR/PIL026RxMX24IsFyyzX0MPj+dQdRfWG8V4/69lA5bfTc8K
         cL9suu4wK+80AJBBBayv0U2Hzd780AtpRkFcQ+yvSv2cX2ffludEGsNYzRzuFG4oqM6B
         gRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703816; x=1794308616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/tD48MGHqLnmAdhTZyJKf923rSTUCONYQJ99Soob3WQ=;
        b=UICPYQKmOcsI3Wz2+c46GUnsznFXMj+gS5yFeE8AFG5UydX7pR/r4f+4ZC1VVUuiYb
         AXb8kGI+nfzSCvTOxJ2vVmpoEAXwNVSGK8pPAHR9o3gL/QVMq4TA07ZqHqRhTqohJNbZ
         biz29oanGnGkEQxvnrcC0UipWSS9xGLlPxsjh9+tXMgHwpQ1zg2JmEPWKByksugOECUN
         4Dhfhj12yYQ8aP5Wo8cjSCPob3GZxbwCh44HhgYj2nG5VasG3YxWdbs1HeoYuRcnLy7k
         +9ELH8vcWuH3A/Mua2jhZa/xWp2+zitAmsGNqAOErAknhEvq6h4/ZFzRS2CVIvaIJSJR
         ZQCQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/olwP5cizxWTiUu67HmZtFzrWDoZStMLd3Rm5op2fEuEurXV1TXB2WXHlO40T8X694z5QPTAW/iQ9t+LZkPQ4@lists.infradead.org
X-Gm-Message-State: APuU4Z+7IaxX+6uWeSVDYY4cxeZKcSW3cYHA99t3iNZfyH3wyX1UZd8n
	Yn69fX9Dtb29HGcsDG697gyZC+BlyKACTJBxFm5ZuTQyXR0/1lmSLA+0JG7Ddq7sXZOkHQ/5Q+l
	4x07VUHfIS55BLIMxEulQYWixf3hdlII=
X-Gm-Gg: AYBFou0LqOmAtoNsZM2VtotBlHv051mwze2fL864zSd6bSqkscACqxCjIuDXd7h15dd
	rtu9efUk24tOOi0J8h/aexG7+vETPQASaAW7AQ373jgJCsIoAmZEOpSK628HV1Wq6MNFFJMbXov
	2JmDmcjnVyRmayCrTl8ig5tYk0mPItkWNOlphYLdBs/u25SLgFxAb8gFQm5bjYEAw0MHBcTkVJG
	cFtDDI8xKp81jv0Iz/xXAbxSANm85nGbjx6pxvKx789YfM0l15DphENuTE0XpNARqm2Mm5JIKAP
	vjwAdKTDioLPCgn4BTAzRRAB67Y04LIQOFD034xWa+C+jZ+M/mZdr6efj+qGTDTomICntKZT7UW
	qjlciMLJHOiMDwK3hCGrB4rzZFTZQQpk0xWQ63IVt5LaMFTexeZVUlpI9GpdPMpw3601rWSzRWF
	6QJ2r2aWXX0fnHALaRMiUT+tUyowcNOJCxjY9UwprzcGl1/pkxeIdaxKHhDf6YhpV386C9xnPsZ
	Gc672msZljSh9iAAq3jiqHoqvjLJAsiE37w
X-Received: by 2002:a05:7300:fb14:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-36a41daec1emr26417345eec.0.1793703815962; Tue, 03 Nov 2026
 03:03:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261009124124.1176706-1-tomo@flapping.org> <20261103.182511.1470121559944018656.tomo@flapping.org>
 <CANiq72=Mb7Vn9O0baOJFRf68UiZoxK0RjdXBFLw_hCHcqCkZ_g@mail.gmail.com> <20261103.184857.703333269279645088.tomo@flapping.org>
In-Reply-To: <20261103.184857.703333269279645088.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 12:03:23 +0100
X-Gm-Features: AclHuK9tF7xeV76Hp_V-v8oWcbsg6n3jnWRg3HfYjcxv6S-Gfl6ml8cTT4L0rFE
Message-ID: <CANiq72ksy24=6d4NbDsF3jcLHenz-HDQGuf19VTQK3rkV6zu_w@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: rust: Generate unwind tables for Rust code with ARM_UNWIND
To: FUJITA Tomonori <tomo@flapping.org>
Cc: linux@armlinux.org.uk, ojeda@kernel.org, ardb@kernel.org, 
	chrisi.schrefl@gmail.com, linux-arm-kernel@lists.infradead.org, 
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org, 
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com, guptarud@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_030336_963853_70A926BE 
X-CRM114-Status: GOOD (  12.12  )
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

On Tue, Nov 3, 2026 at 10:49=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> I don't think it needs Cc: stable. It only affects the backtrace in an
> Oops or a WARNING, not how the kernel runs.

Thanks Tomo -- I was mainly asking arm, since I didn't want to pick
the wrong choice for them if I were to apply it.

i.e. I agree it it doesn't fix a bug in that sense, and it is safer to
not backport it. Having said that, it could help downstream kernels,
i.e. it fixes something unexpected in the backtraces, so it could be a
candidate (the stable team picks sometimes things that are even less
of an effect). And thus my question for arm.

Cheers,
Miguel

