Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15042606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 06:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BZiceER0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zr5WgfJK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oafp5dXvXRFz5XLlyaIwK3pSxcRN40X26RgUfnaYz0Q=; b=BZiceER0mN0k16
	sqNzKP9aJvKORfVvqJiVuqn5Hnm/xZOU3hq/NXdUy1SxAzv2RXrAUBvTaq6Kqt16SuXwyn5AQVyTq
	1kpw9pazhoc8YRtwCUCxvuIl0nt6WZcYF+3uUODPuTMz+cx5MY7yLxbZE1RMfSdgj1frSDWxQDvAS
	wYpRfvgRDJHWlMtqbC6Nli58gyKAFxaRxIovNqpOZJK2bkWj8OZAKR1TfSs/49R/0pdg80+sqOJNu
	Zlz6wdAmX2obvVB67JAZd4oCagmqIYbYjScZWxOHF7S48AI13sLoQNsDcQlz+5ww+HwHW1etHpWRg
	YLRSk0rgvq/JZHFXi3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLar2-00000003rDg-3pdA;
	Tue, 27 Oct 2026 06:40:16 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLar0-00000003rCv-3oD1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 06:40:16 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so5478355a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 23:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793083212; cv=none;
        d=google.com; s=arc-20260327;
        b=iJDERRlt84XsOu1G1OiBR8wmDhOMv338Y26l3GsTSlg88Vz50KsiiffNhZZp0pbgOs
         db6BbU/j7mo1XomQH6uqA3cA3myYAnY6Dn22wJpkDH45WPGKgcUxoVxm4eGct6W0DA/T
         tfrqlv7ZBonETXcBItvGfK3cgkw3S5pkE0lL9GT4/ov/wPVBC4ATwRnJPC2j0nvQplkN
         7jgHXdtwOZUpJaBwBkfnZWRvKZ+H7vJpCb2Lks01m8V44nr5h/rAXhS6B1647R/CFwKW
         W1bMfjkGo2DXDfF3SGUmoiqg7s/C9x5n3Uhs/VxWv0zj4YkTDrFdvY9JOk6tHwq8NcLT
         J/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oafp5dXvXRFz5XLlyaIwK3pSxcRN40X26RgUfnaYz0Q=;
        fh=XO1RAXyvqFNdUORYaW3a73PuOo9rKDjERb98AI59zpw=;
        b=Smqg+EloYkPAZRwE7uEeCJuXZtRPKGzz2IyXjA1ebiE5IEYgkWYDatYyhgmOaRWBZr
         vLma3Q7Dedp4rT8CfdntMUc2H9cZqy9SP1E7pIgLEAgC2tuvik9nKMBBRTREvMC95rZO
         clio3Cax5qaJeyNNvnwEkrM08KMY0gSEh/5uXTSrtakvxhr3fYsY4rZnqBfU7oWkEzfG
         IilSV4c8ytUZJ7LBsxSbTjPmlEMtNKbq/di8V+KkfPuqVsV4yN8aiD/ES0/dWHVxyCK3
         LinuxH7pb4RPjS0zGYFbBePU2d7kfL8QJ35/0qUHJD7XwW5K/KShiML98CJ8BqxFBE1c
         fR1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793083212; x=1793688012; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oafp5dXvXRFz5XLlyaIwK3pSxcRN40X26RgUfnaYz0Q=;
        b=Zr5WgfJKQKdrvxBlOKkLuIQDWrkeO2qaqTe4/YHFkgEDYwqTVH9UrewA4RS+vCr5xd
         OX9bOS+5oQtJdPNazeqeMjGKDk0hRj88v1aQlbNsbvTZiz45OcbSaqvtmmdxCJU152U0
         CNWSu9vbNT8a3qEN9irAEX3+uyRwOxd8cc/LDUgnv/e9O68SLqMUFTsnYxAfGddU+1tR
         y4QMVxVMxNJzZUVmVBHnyYqgH+5799OIbEW5o1eBInLAiKXOSe6dt3W1J0h0oZ2RB+//
         d+QzcdGXWes7RHKmFpTEEEzIfdST9UeqKfyB7nyP0GvyXpXqeuvHpEcjj5+BbAUscNDk
         YFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793083212; x=1793688012;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oafp5dXvXRFz5XLlyaIwK3pSxcRN40X26RgUfnaYz0Q=;
        b=fL86G4vdv988zzYuZmTgxMRGudElRY4mD+392tpGuPo8LuPlHBHtORTIe+7wP6/y1l
         H+eIL7SC5d9OKDeOOLFytxeCTdIktBia/rPiMFUEIASM0318cv2v2NU/+QoHyU7Hs9je
         7TuW+/bp7ztUicHq9vF8U3UOMsYUi9Sir7OVK0fKMZS7uW2ldGMBCX0K2u83nDeXzzR7
         68zAwCXz0NqG11zI8N7x6mUUG5K1WT2vcK7pqLYZLybGpigGGIl3wrwnJEbHLoMbNdDd
         wlZDgXmrJIAZfj84oF1lZ+ojXXeAzC1nvzOzypBCTbjFlmjAesUdbTMReTGk1/9Haaed
         0I2w==
X-Gm-Message-State: AFq9FYJMsSZFiK4gJ/kpZo6QOUnGoRXMyL/EBaZMMb9wmXhYTHOQjZrS
	/8SQtNNoxh9/0kkPc3MgJqtZekpSgWwyIPIZiHT8dmW4y7W5XrdZ3lLIpC946Yo6JBtV6DcYLRn
	4bMHb6qAhM7wGexmUggkLnVmDz+aMfuw=
X-Gm-Gg: AYBFou2QkzjyZY+m1VYR7ElHXccMbvagdKhQz6xSJvEzA/WDqj06Z10P+eGW9wC2WEZ
	zAf/ZdzkWg4iGng1LumR4DxP+M8+g1aPp1ibY0GVvyvCUxL23cZ0l2IySHz1aTu91jKgyL2fBDK
	Cqbj8Bq9JNhFUqHtSvi3WTUDUeXqc/Yno1ZtT7CSyOU3QEcfPo/kPBFRUurubS+LFtgEB13k0Yd
	0R1Zhx575+qNMNILbmrL2tgN0OybbqgR1tQjk1SqpUfqh2XR+DdZlFlCF7SA0x2XPTgt40LXpJJ
	h4j4Xn/HeCenqhEX5e5pcnBg8oSb0Q0yo7mFH5xOebkA3qrvoGmsUZSbbKJSORBKsVuw0bMxMvW
	+CBEWEgSnVSGsJofJpFKFpjG7qdyW8J7RjVE7cCZjZWLWYgzXn2kvcF+BrAbJ
X-Received: by 2002:a05:6402:b25:b0:6b4:1902:f197 with SMTP id
 4fb4d7f45d1cf-6b442fd0001mr6794226a12.17.1793083212204; Mon, 26 Oct 2026
 23:40:12 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001090050.3849551-1-beata.michalska@arm.com>
In-Reply-To: <20261001090050.3849551-1-beata.michalska@arm.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Tue, 27 Oct 2026 14:40:00 +0800
X-Gm-Features: AclHuK9lj-E99WshHUaMtWkmrbT9LNYYzV79FnrI8SFTadnxc-WEa8pOd3bNFrU
Message-ID: <CAB8ipk-3pec4PCteA8+moHveHobE4FZgHbc4WnpKkJRyt=Vwgg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] arm64: errata: Share broken AMU constant-counter handling
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Vladimir.Murzin@arm.com, 
	catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com, 
	James.Morse@arm.com, seanwang1@lenovo.com, linux-kernel@vger.kernel.org, 
	Xuewen Yan <xuewen.yan@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_234014_965884_2005F867 
X-CRM114-Status: GOOD (  16.53  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Beata,

Sorry for the late reply.

On Thu, Oct 1, 2026 at 5:00=E2=80=AFPM Beata Michalska <beata.michalska@arm=
.com> wrote:
>
> This series factors out the existing Cortex-A510 erratum 2457168 AMU cons=
tant
> counter workaround into a generic broken AMU constant-counter capability,
> then wires Cortex-A725 erratum 3821522 into the same handling.
>

Has this patch only been applied to the A510 and A725 so far? As far
as I know, no chip has received a fix for this issue yet, including
the C1-Pro...

Thanks=EF=BC=81
> ---
> v4:
> - use midr range instead of multi cap list
> - reword comment to be more generic
>
> v3:
> - splitted the commit and droped changes for cpucap_is_possible
> ---
>
> Beata Michalska (2):
>   arm64: errata: Factor out broken AMU const counter cap
>   arm64: errata: Add Cortex-A725 erratum 3821522 workaround
>
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  arch/arm64/Kconfig                          | 30 +++++++++++++++++++++
>  arch/arm64/kernel/cpu_errata.c              | 24 ++++++++++++-----
>  arch/arm64/kernel/cpufeature.c              |  2 +-
>  arch/arm64/kernel/topology.c                | 16 ++++++-----
>  arch/arm64/tools/cpucaps                    |  2 +-
>  6 files changed, 61 insertions(+), 15 deletions(-)
>
> --
> 2.43.0
>

