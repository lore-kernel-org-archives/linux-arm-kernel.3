Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BBA606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T7BOUJhv;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lf4beQsy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VOlyAtS6nw4UaimVZudbFA9N9IY+hFNzuca71S7UO7A=; b=T7BOUJhvwTm6B5
	RI32CsSYJgkYF3TpvBAUlunBI4iXBzV5ao5mptHTvw7IFOXM+4BY91GgpSV0xOgn4fTJnLdq5hGqp
	hFBKWSTtv+0bBl8N5JOPdnokz7VQnUTtsCM86wXXpxZf18OKuGFlmImwXOeFygNs6zPnJ/8slnSPM
	94CB9Gq5JzsTD0DfJupDdJgeWHs2HAW2Ifn6B42sOVvYbOsDImGh7n5TNejCoE9NW+Hnd31FVtkaQ
	7ZKp3lQ9GLMeTbEUwIeJBtpIPVAS9xYAjZ+Aru9IBg0K7Vb/lkBwgSPYsvFCGTKJijG+pFiXafJEP
	+WCbbBK8SQIzzZj9fLmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNRLG-0000000E2Xf-2vHB;
	Sun, 01 Nov 2026 08:55:06 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNRLD-0000000E2Wo-00Qv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 08:55:05 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso5486833a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 01:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793523301; cv=none;
        d=google.com; s=arc-20260327;
        b=CcB43xsmYlfNjldkE3kynAIxikXh2sbBSXjgEufY0OczKiLgDCfSI3+IvTPUfcZSHC
         PcjIzvX7YdJ7/UodBqQrnuBLzjkJTPq180JISUeWAvpcOoSSamyXKSsBZHMlgD0uVEkf
         UrXqDZKy7IgrP+J3z2JloHUYdStB/7BbwyxJCXYVTVGru1FpR9XCJwAUCJVIhNImAzfq
         9v9SuvGu7JPCYRLLGBroF858MtIBU5n+INEv08G7hNzgORzibGQ1jjowGMSto3orgGf8
         YDmmGVVsW4vLsENM5rR4o/7fUI4ADhIAuYgMVcj9REhDcS/qxOX1i/DrJ/9CVtspdy/R
         bsNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VOlyAtS6nw4UaimVZudbFA9N9IY+hFNzuca71S7UO7A=;
        fh=WizW3ndv045ZwkxINTwnawQjHb0pAISX7Op7MNxtwHA=;
        b=TmDbcfZ+5ALZ1Z2d8Q2m5zzYFA0cJ0OxQ+iYsD4nTUApthVFGapsE3s5ThiKl3iXQC
         VGsuCuxaJXFRWTDfW7xcccvtl8pVUNYiwJtMFmp20x05Cjl0MAH1s4huPvMLKQ4i2HMX
         MJFGbCjh5EuNtI5YQ3GaAjZFjCF1EgIC22soA+NTzlBI0Se5WoogJq24Jtk0SR2IpF7H
         1zrmZ/hcTd2gRLnCidbLKGMdjM5SoxJ9MwN7HJYzXoj/P6eT5vut2JU2ybMPLoxgfV1F
         wkxnbQyjD82vtpdNwUIzM2ovXTLjh0hrsoOmWv+AlxkCQgYVrm9bJXRZ2unN8qMGausg
         cycw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793523301; x=1794128101; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VOlyAtS6nw4UaimVZudbFA9N9IY+hFNzuca71S7UO7A=;
        b=Lf4beQsyM8Q8DRvv1MXKCVpRVGj1crX9m3qt0ZjEYgDpNJU7w+GfnmNMbeWstgP0VL
         IuVmIaSAsxx2LWe0ZAfaZCt7i1MXTxjzuhGOmZx4l0PblZXESzEafVho31QOk0Sb7wqJ
         kKQOPntlmYvAlSK5KxSeuJz0Gc3oM+obuJtsELRWX79j7Zr3O0H2LZc/vcszHG67te/U
         oKw1LlwOI8JPGc390e8SYNqaf70oA8xBMqxRT5Zxe6WdNwtFdqaPAH0vlxWzwDSejnhC
         YMn/M6D0tosOUW9xTTET49cgxxnsXfsPDLLl/I0qki1IgGSlX1AwaoDOwM/26BaRnaGJ
         d35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793523301; x=1794128101;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOlyAtS6nw4UaimVZudbFA9N9IY+hFNzuca71S7UO7A=;
        b=D/kSQKjvqvuP2usBufmGYR1BWSXlMEQuItkoRSDqo30QSiESxqG6GX2vJ1gy+n7c6K
         oYe7P1EvEt0O58+Hq/uUmV4QrQqpLkUPkJ8z4P+ed4edOHKa2XahXwf8QO2HgaVmx5dR
         5scY+J+ml6NiyirBZZ3v7l1GhSMSvpgnXp/n2iDs9pT4VYYr7Vn+47SVMARJh4kglVJB
         5nlrXYXDgHD9LFVoSgqDwDJ8Y7GgoVedMY6u6H4hmQ92yVrHjt2v9BIXVx9DGjDJ41lQ
         HIh1rrXqL59JtVO6p7Z8+KTJ7HrnnDakHt4DAFRtUm8fW+mIQKx+E1hZwLkQmAVHCmec
         jEeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPoBdUz3eUKPxnIPLFaCkxPBUtBdjp/hYz4E8jTMucXZ7FyQGiZ8wIAR5fsiwtgWXzZY/u4etmYJdX2yHHUjTs@lists.infradead.org
X-Gm-Message-State: AFq9FYJyKz5+bZQ0V91sAN7lRo3bJ3bGYM+px/JYOjIcXtfUmeYBQK5z
	DyFpeWr8nI/DSmPzg3C6ebLfeEmVNEYMNpUyrDgAUuRTy2WQPLCmSLsJLK+kCsFjWtgS3yhakpl
	SFJ/AEy86A/lV0JNZIW58u3OsyBHauFA=
X-Gm-Gg: AYBFou0YojSZAFUEnjdIFc0THP3YiW7Trrpmde0J4aBbjgLJr/4pKYy9v+QJK6oZ8JM
	eLbsBOHen+tK4t0D8LK+RT5smtVAod73dmVnrjtBUWcvw/UzUQqiWL+rlunXtPWYAN4RyEo0aDy
	kb0lFE72zDMsr5trWng9/T0cGyNv76h8zYxV5tOjg1YMjJ4BWxpH5V8QXrziR1aK8DXNh/pEv0R
	v+jEFzD/E9Sz9M79k3BzFLxEv8N2umT2I47v7jqdMA+cYnej6ulsXNjnL+HdG+4Umw2q5sEIumw
	mGy3bjDw14g02pHKuCSuvnSFL3eb/uaF5oqBdD0UrgEnjgmmFhext9odfExzFMGUsBnii98XaAN
	kEDuCR4PYE+TVNYbcmr1cOiycdKdJ/fhYIJvQaw==
X-Received: by 2002:a17:906:c112:b0:c41:9a35:17a2 with SMTP id
 a640c23a62f3a-c49d14eac79mr860609266b.31.1793523300772; Sun, 01 Nov 2026
 01:55:00 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031200925.3364-1-yuanzhenpeng210@gmail.com>
 <CAFBinCBo0C=KABcg5ueDTRSJhF9vmWnPwYHbaMGTOYppOsabwA@mail.gmail.com> <CAEDN0nDjYLE5hy7gVLQ3hv1WESVJQWgc7T_8aLqzRui036A-_A@mail.gmail.com>
In-Reply-To: <CAEDN0nDjYLE5hy7gVLQ3hv1WESVJQWgc7T_8aLqzRui036A-_A@mail.gmail.com>
From: HELPMEEADICE <yuanzhenpeng210@gmail.com>
Date: Sun, 1 Nov 2026 16:54:49 +0800
X-Gm-Features: AclHuK83pVomP0hrq6j_fybbi3W3-j8J1pzjtv8v1_2m4qUqV-NOu-WaXgCPqzA
Message-ID: <CAEDN0nBEK5PvkV-eC11XHYG04Occgs6o9_9K67OZn+xtkh68yQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: meson-mx-sdhc: add DMA bounce buffer support
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, ulfh@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_015503_085006_B03B07FA 
X-CRM114-Status: GOOD (  32.34  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Martin,

Thank you again for your feedback!

I've completed the comparison between the original driver,
MMC_CAP2_MERGE_CAPABLE, and the 128 KiB bounce buffer implementation
on my Xunlei OneCloud (Amlogic S805).

The results show that MMC_CAP2_MERGE_CAPABLE alone does not improve
performance on this platform.

Runtime instrumentation confirmed that:

- dma_get_merge_boundary() returns 0.
- host->can_dma_map_merge remains 0.
- The block queue's max_segments remains 1.
- The merge-only variant behaves essentially the same as the original drive=
r.

Here are the sequential read results (MiB/s, mean of 5 runs):

                 Baseline   Merge-only   Bounce
    4 KiB          11.81       12.20      13.01
   64 KiB          12.88       12.80      57.52
  128 KiB          12.97       12.80      67.68
    1 MiB          13.11       13.05      69.43

The bounce buffer improves sequential read throughput by up to 5.3x
and sequential write throughput by up to 2.1x.

For the 128 KiB sequential read test, instrumentation showed that the
number of MMC data requests decreased from 70,599 to 2,465, with the
average request size increasing from approximately 4 KiB to 118 KiB.

I also tested DMA mapping with 33 physically non-contiguous pages.
dma_map_sg() returned 33 DMA segments, confirming that these pages
cannot be merged into a single DMA segment on this platform.

For safety, the tested merge-only variant included a check to reject
DMA mappings with more than one segment. The pure one-line variant was
not executed.

Additionally, I addressed the issue identified by Sashiko by checking
cmd->error before copying bounced read data back and reporting
bytes_xfered.

All 135 fio jobs completed successfully. SHA256 and CRC32C integrity
checks passed, with no MMC errors observed. Fault injection testing
has not yet been performed.

Based on these results, the bounce buffer appears necessary to support
larger MMC requests on this hardware.

I plan to incorporate the error handling fix into the next revision of
the patch.

Please let me know if you have any further suggestions.

Best regards,
Zhenpeng


HELPMEEADICE <yuanzhenpeng210@gmail.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=881=
=E6=97=A5=E5=91=A8=E6=97=A5 16:46=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Martin,
>
> Thank you again for your feedback!
>
> I've completed the comparison between the original driver, MMC_CAP2_MERGE=
_CAPABLE, and the 128 KiB bounce buffer implementation on my Xunlei OneClou=
d (Amlogic S805).
>
> The results show that MMC_CAP2_MERGE_CAPABLE alone does not improve perfo=
rmance on this platform.
>
> Runtime instrumentation confirmed that:
>
> dma_get_merge_boundary() returns 0.
>
> host->can_dma_map_merge remains 0.
>
> The block queue's max_segments remains 1.
>
> The merge-only variant behaves essentially the same as the original drive=
r.
>
> Here are the sequential read results (MiB/s, mean of 5 runs):
>
>              Baseline   Merge-only   Bounce
> 4 KiB          11.81       12.20      13.01
>
> 64 KiB 12.88 12.80 57.52
> 128 KiB 12.97 12.80 67.68
> 1 MiB 13.11 13.05 69.43
>
> The bounce buffer improves sequential read throughput by up to 5.3x and s=
equential write throughput by up to 2.1x.
>
> For the 128 KiB sequential read test, instrumentation showed that the num=
ber of MMC data requests decreased from 70,599 to 2,465, with the average r=
equest size increasing from approximately 4 KiB to 118 KiB.
>
> I also tested DMA mapping with 33 physically non-contiguous pages. dma_ma=
p_sg() returned 33 DMA segments, confirming that these pages cannot be merg=
ed into a single DMA segment on this platform.
>
> For safety, the tested merge-only variant included a check to reject DMA =
mappings with more than one segment. The pure one-line variant was not exec=
uted.
>
> Additionally, I addressed the issue identified by Sashiko by checking cmd=
->error before copying bounced read data back and reporting bytes_xfered.
>
> All 135 fio jobs completed successfully. SHA256 and CRC32C integrity chec=
ks passed, with no MMC errors observed. Fault injection testing has not yet=
 been performed.
>
> Based on these results, the bounce buffer appears necessary to support la=
rger MMC requests on this hardware.
>
> I plan to incorporate the error handling fix into the next revision of th=
e patch.
>
> Please let me know if you have any further suggestions.
>
> Best regards,
> Zhenpeng
>
>
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> =E4=BA=8E2026=E5=
=B9=B411=E6=9C=881=E6=97=A5=E5=91=A8=E6=97=A5 05:17=E5=86=99=E9=81=93=EF=BC=
=9A
>>
>> Hi,
>>
>> Thank you for this patch!
>>
>> On Sat, Oct 31, 2026 at 9:09=E2=80=AFPM ZHENPENG YUAN <yuanzhenpeng210@g=
mail.com> wrote:
>> >
>> > The Meson MX SDHC controller uses a single DMA address for each
>> > transfer. Since the driver leaves max_segs at the MMC core default
>> > of 1, large I/O requests are split into single-segment requests,
>> > typically 4 KiB each.
>> >
>> > On an Amlogic S805, this limits eMMC sequential read throughput
>> > to approximately 15 MiB/s despite using HS200 timing.
>> >
>> > Add a 128 KiB DMA bounce buffer for multi-segment requests and
>> FWIW, while reviewing your patch I found that Amlogic actually uses a
>> 512KiB bounce buffer in their downstream driver: [0]
>>
>> > advertise up to 64 scatterlist segments. Single-segment requests
>> > continue to use direct DMA. If buffer allocation fails, fall back
>> > to the original single-segment limit.
>> >
>> > Testing on a Xunlei OneCloud (Meson8b, Samsung 8GME4R eMMC)
>> > running Linux 7.3.1:
>> >
>> >   Block size       Before       After
>> >   4 KiB            14.47        14.69 MiB/s
>> >   64 KiB           15.06        63.21 MiB/s
>> >   128 KiB          15.08        75.13 MiB/s
>> >   1 MiB            15.07        75.93 MiB/s
>> >
>> > For a 128 MiB sequential read, block requests decreased from
>> > 32768 to 1024.
>> That's a nice performance improvement!
>>
>> > Direct I/O SHA256 readback verification and fio CRC32C write
>> > verification passed. No MMC errors were observed.
>> >
>> > Assisted-by: LLM
>> > Signed-off-by: ZHENPENG YUAN <yuanzhenpeng210@gmail.com>
>> Could you please compare your patch to simply setting mmc->caps2 |=3D
>> MMC_CAP2_MERGE_CAPABLE; ?
>> From what I understand this will allow physically contiguous SG
>> entries to be merged by mmc core.
>>
>> Ulf: the code here looks similar to the sdhci.c implementation. I'm
>> wondering if there were any plans to somehow move this to MMC core.
>>
>>
>> Best regards,
>> Martin
>>
>>
>> [0] https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede=
6da69fc61a7cb04b6/arch/arm/mach-meson8/include/mach/sd.h#L627

