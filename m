Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06DF606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 03:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ouUTn8HA;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NM5F+YCC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sM7dfig1i2Wo8yfxI0EkWeP7nZ/u088DEvbNtpb57pM=; b=ouUTn8HA81d/k/C7dLdaurNcrD
	fcjsxHyKi6gsQkPHuc2f1Uwt+jCm6GmcAeSEo2nm7hTO3OPWZavDbh332CtFdW4OHndIuFSTPIuWT
	jXWs2uInBkPUfs4EITGu3cymC34l/4wczK5knDh556PPc94bRagjbYZ5//rf6dvzsMnqjlDtK5CNu
	32MIoElC1onBTp4SCfAgNx9dvz9ri9/oIt0bjUm+d9eicJQBCnBVldl4AcQup4qs33mvvquIIX7gC
	pUkiCcSgYMBfa7yscrKN0r0cL2PDgQPv2fEvgwwGa9T7daec5E4YBqgGXj6xsCxzSXRXS9UsMK1aL
	yUAcVVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOoV2-00000007ho2-0OQ3;
	Thu, 05 Nov 2026 03:50:52 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOoUy-00000007hna-3cbK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 03:50:50 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6b57182c4c6so1065862a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 19:50:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793850646; cv=none;
        d=google.com; s=arc-20260327;
        b=fRFCpPC5x8agA8XcfVt6P0zz7rwNQJ4d5SKRLPmeSRwvbmYyVRUCsWSF0sFgzP93FT
         t8x0gTX6EYQfuPoQWD3dQmxKTa7wrjBYs2B1cbjAIvwxpRadHGzad/Sz0UgwW7ohxNYJ
         Yot7ebBUyHxa50cZ0D37esVshxhtQnFMIxqyny5w6kSYR9z4gsqqrcBuIRT0EsTveOqx
         eyzDh1UWSC2HRxOwkFuygvTitv1vqLeDKyU0H9r84l76xekEd5MXEa58aW3GKV+VROrx
         7YE0fesR+PCABKTPLfuJCXVOCb6lnYWxHxXBO32M/lvv7OFKoJ9fOJWB5CyK1hJmjv49
         hk7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=sM7dfig1i2Wo8yfxI0EkWeP7nZ/u088DEvbNtpb57pM=;
        fh=LyC1ZNPsS6cHeGnzxfVhXOg5kwKT3gFr+b/VKFoLgow=;
        b=TCYwgJp42ulp64VxWx0lEdA/HN3jkiOlNr7OrQwEG62VFLP5K0tHbMPHPU8Y3EcxdV
         p+imXhqXh+MOtmxP/7Rn5Kfsdaikcpv7ihhyQZFXLqdhvDxZpreY7mVtFXhy0BY1mtow
         x/6rapPYZGrYescW6Ud0AiUz/eHK04hP6/C3GoW07q9R+AMoCBLzB+TbCLSvO7w3vlre
         lQUpQrGC4GZglo1Dw20x/RFSq39SJjK1OIs9h/AqharICC55q9T7thOmsFKrgBdjYhvB
         RF3VXOpcSu6SB5JZrLGZ17bpCclKgLUOZz1BmOXDGkhvbkHBFmpHSjPEOKg3jW8UuE+R
         H1DQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793850646; x=1794455446; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sM7dfig1i2Wo8yfxI0EkWeP7nZ/u088DEvbNtpb57pM=;
        b=NM5F+YCChNlU4RaYaU+9SJFdJ+lBbaiUTIsmJRzLQ0pqg0gGL4kyrGDSJG8OcU6FuT
         SylNiSfrVqsuZ5iB7oL4AxXavx159jAkINA6brLacfZpLu1B2fujz3MbrGQiBCm6I2Nm
         73iY3dmLH6Vg9EzsRLc3EuqHlqOAJM4p9V4XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793850646; x=1794455446;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sM7dfig1i2Wo8yfxI0EkWeP7nZ/u088DEvbNtpb57pM=;
        b=Zok88C1+9F6B3cqguAPP4ZV9QE3LP7L4eLDzkn+YP2Q+tJBh4nLS1dfhgLZi6uMvit
         4C45DtFCjwC0A3UXZbHzF7DpT6VVi2/80MFvXZA5+j4NVlxS916n2RPpWnFtIWva4CX1
         6S7Y4YUOQgjafEErI9Dv50YOjK2XvIsKr3N53RB85+vfJw/EPm/bgSHRLEHFtcOGSAzH
         sadLSJKUOHMc/1MC10K2iKrF1rTlIeToEisU+wm6HGgnkt3Bkq1W1OiDa5MqSCjEA4+6
         zkkqvBRid6GqnRenCj5iRonwMqT6DCIcGdrofAMxULzfyKQ5OAhMLObYK+asN5OWF5rl
         bcqA==
X-Forwarded-Encrypted: i=1; AKwUvBwrOTuhH86ANSqc0lqp3X7FiBHzBY38Sp1R3B5H5Dx3BLbkcC09j0QbiXXG+aZ3w4kfnn2I3Uf4Ft3F2Y0K4Dse@lists.infradead.org
X-Gm-Message-State: APuU4Z8qJHhL2Mz/olkCPzqVAOZC5jMmOUmVZx+hKV8zN7L3GR02wMm5
	3ED9ZjAMeohYRWDjQvniCdd/iYI0rEccD2cQgPdAPBWkacBfoBZW4GxvOYXNp7mbvVH7XiRzq/5
	RbwG7cfuO/z7Ie/uMTODJHz916r9v70gEYERqK6c7
X-Gm-Gg: AYBFou0utXVvLTcGwVtMQjSHCLn5i/2z1VgJkCw9TkpUp41V/RSK9Jmh2d9qLkGyx6P
	QsHxtM9AKzJwkIMj3SSIisK30BqhWMX1TEoSinLTtQWX1aQxZwh8xzCnlMlbZOQvfDSbFf2EgGN
	KK3mLtUr9GOVzRL/EpcgE4nAe2EclSplvt7qRR7j20q0glX2wWwAX1383FuXRJQRAqL43s0gtV9
	5FSyLNa6pDxLHHtga1PSowNF+tc9l2lcD3XFgSVBVg8Oi5EFhFwk5TRr6FJ90Eoc0H2cauDAl9r
	cYNdBa3TwWRKu+83ngsTLaDaIUAM4tCfIRZdYKC0lvBG/PpcMihwcgfK2pt54xSeaqVCkfjfHH/
	YPMn8gZ8w7hM7cx0451/dvcLAipUktUmlIma3Lrtc2iWC05bv9oBT8zZjOB2cGLDHAYr6SZg=
X-Received: by 2002:a05:6402:3226:b0:6b5:6cd3:fd8a with SMTP id
 4fb4d7f45d1cf-6b56cd3ffa8mr1897964a12.10.1793850646372; Wed, 04 Nov 2026
 19:50:46 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 19:50:45 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 19:50:05 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261103164206.129723-1-info@daylightlinux.ch>
References: <20261103164206.129723-1-info@daylightlinux.ch>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 19:50:45 -0800
X-Gm-Features: AclHuK_p7SrW3AO3gCyVQXkIb1oKsnBVS0cSjYV65SdJcUExgm3dRdAamPth3Og
Message-ID: <CAFLszTj7nbGtfviOgcJZtZShaTvSE=viAhBPziBwnMa_ZisBUQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: make_fit: propagate compressor failures
To: info@daylightlinux.ch
Cc: sjg@chromium.org, hamdy.aea@protonmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_195048_920663_36C71F47 
X-CRM114-Status: GOOD (  11.05  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-03T16:42:06, Hamdy Abou El Anein <info@daylightlinux.ch> wrote:
> scripts: make_fit: propagate compressor failures
>
> compress_data() ignores the compressor exit status and marks the
> operation successful even if the tool wrote only partial output.
> build_fit() can then place that truncated data into a FIT image.
>
> Use check_call() so compressor failures abort image generation.
> FileNotFoundError still allows trying the next supported executable.
>
> Tested a compressor that writes partial output and exits with status
> 23: compression raises CalledProcessError and the CLI creates no FIT.
> Also generated uncompressed and gzip FIT images with a real DTB and
> ramdisk, and verified their payloads through libfdt and gzip.
>
> AI assistance: ChatGPT/Codex identified the issue and prepared the
> change, commit message and executable regression tests.
>
> Fixes: 7a23b027ec17 ("arm64: boot: Support Flat Image Tree")
> Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
>
>  scripts/make_fit.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

