Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C4B606A337
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2WsROWaq;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=WfjJGYvr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wOzU4J0to3q5u75B4/uwG0UTHx1qIwAg/dSoR7NVoag=; b=2WsROWaqKET/Yc
	OCjEf5Bbh/wJ+DBrfPujR6Z1WIe1WYWVY5zIlxtBpPDtiOZzYpZtyQLyAOkdxjCQU3rsn/ElLX1Vh
	ns9ULG9RL1sNgL6IDVKNkpQWmhc1rF+DzpAWp4NFu+ICHuy5XNtf1JsU+AazZITKwL8HkOMnF34ED
	QQO5Xo86g77Vv/jGfOUW4fj3WncPnr5aEgAGmrk+HauowlT+3ow1G6DGxI7YRJ1eVov8CDWfAXP3a
	pXiDKaFwTP8iRcJ9Ri9271FX2LdzSTqRwAH0z1DMYHrdsw9HeYXop/8aTJcG8vcm6wfQYkcIMGhDa
	/zteuL8Km2qZByMAxyGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNePK-0000000FBA2-1bDK;
	Sun, 01 Nov 2026 22:52:10 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNePH-0000000FB9F-3Xuq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 22:52:09 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-679e6ab6471so3027323d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 14:52:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793573526; cv=none;
        d=google.com; s=arc-20260327;
        b=bwdXq2VnlOEXPVkKUJbDMlV9P/IwsKOqdZoZv9VURVG5e88yMPO5QhYBE5fwaqbhPb
         eSQouvhW+LeWud/2yOJAszhQxxOuNOLrrQuxwSDW/2AD4lDW1kS0rHmsmnrCNDsujO4S
         DERi1iWbLBj8YQSdnqBu6jb7okCioOxI6RsNdSAd2EL2wTNAQLPSOME57uUEz25NmYGI
         tIWZLQTk5N+C7VgIGXecoFKBsLpU6QGx1ARWl3P+KPOyymbjcXvL7uM+TtUcvhH+Qmp4
         j+LjbvxAzuZjmyp3BNv8V4tqgtUuOwKsRzOdW1AFS890Zw7rtxtl8erkP197d74sLlVD
         JNwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wOzU4J0to3q5u75B4/uwG0UTHx1qIwAg/dSoR7NVoag=;
        fh=CNd5g7jk/Uy5u1z44d6EbZxKkT0gq3o/9RcwclHoJ5A=;
        b=ath3NtqC1LjIPccneSkD7e1sZyHYCis8iv7YhBRkH8Dm/qV+gDwS38AXwNBd+7K6mT
         xHLNlQqtq25S4Ve+GJnKbFt85xza1Ng8IvGUtb43U7HwLrD6oOIgUCLVsdCPn6qzHj5x
         QA/wNJg4Mj77zFqNck1Ur4DEKRgnK8131p0bkWghhvmSF34vxV4ohhBzvZTgERAdEvjY
         Fy1CEGtzYkjUbpJIGKNHIkxaHI6Q0N5ZBqdF25VLjobJy6luhMvqDCludgil+5n5c601
         kWqZfvje3BvSqBC+bDAJKruAPfIdFGT1FkC1mjiiMri7f+LZ8v/lPCDH+VRfaE01Upil
         8tWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793573526; x=1794178326; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wOzU4J0to3q5u75B4/uwG0UTHx1qIwAg/dSoR7NVoag=;
        b=WfjJGYvrVO+7Z9XJ271q/Dq9XvIAmJcHvDcp0gsjSeQpy48pOi7/YfhPGTRvqoFq2A
         olMifvQPo3RyjQ0mONRJX56xR7vAjCqRW/8nRRTCVoRjEMk/YoiaG59BRapuXDpNOZEb
         Lndyi13XpUNqQRTH3K2E4JoM7oowri0jrSF7i0D+jZv7xVgpEixV2RVUg1/NF/eHnH6x
         4LV6Pr+IpBbA4AXC/tfNXVncnKiQY0FJLzhlDFHdOSkulz3+ktXuTpYCpGoGgTLcZzST
         sQn6SejOJF858OeNwuWkjZZc3tIG9BpMRoqUTUFScxDf8VJ3Kr12c8GeH6rLFCG5tBR3
         V8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793573526; x=1794178326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOzU4J0to3q5u75B4/uwG0UTHx1qIwAg/dSoR7NVoag=;
        b=wdMg2XqlFgVf+p/tQa4g4pC2phawUBI0LK2l4Q+LcZcbyE5kTCj6E0+3zaAXgdkWeM
         q9dRDeDoPsem47kNWlfd/DHSRFX9jZmzle7zkw+ptUCFwCKcru2DVxPNwmOqKss0N9um
         bdtVxBDi6ySlKGseDUREuSn3ZgvEATVagy2nVHwb6DDIvLWZFms1gYjMiRA2k68R2Ur4
         NrG5C1nrBSmxwOxrhnavADDuL6gNGIQKPo/meOefy+UGH635ORiKNULpCMhrnluuBaHk
         3WTQu6Ebt9o5fAEP9fJ3iPqjbmPvqXJkS42LNZET7gvjC/hNcJZ9n5r903UVW9CoPsX0
         p+gg==
X-Forwarded-Encrypted: i=1; AKwUvBylDtDF8Z11BjGxmEWQFCqqMnem1E207+0PpRQgEzCRQP4t0ZJ3Tgrcatqd0ovPp/7V5OFkCy2jpyqIMixOEvZR@lists.infradead.org
X-Gm-Message-State: APuU4Z8en21p7jcuOlRz779esswHqbqq6RGH0JOqX5LKPUL6Tlla/DFp
	6aftic5k8GSOH1yLsUv6Wj62vbwqWIjUC7k9K44Ldm7eOAEVOfL1o3EwoxZB4+Ocr6BsjGrsSWT
	i4Y06xdl2OZahVlx18YXmQoCyFufeFIw=
X-Gm-Gg: AYBFou06qCsF+SM1pWMSPIaqzZeFnACr8f3mA7JQ+8Kuwuv06goZoTIJF6Sjv5EH1uy
	IbvMLfwcCWXj+AnL71bY7zZbbr8xMWEbt3i7klEH/qkXgB6ghsVkEmni23xIPh3XF++gEUHTl65
	gpe3Rxq6dOiWawCxd/mX7NvOCXt/5W44xzkA6Q25awUxYsoBX1O7h3zvranQADO2I44uWmpHVxZ
	aKSOYjeH5gjVSnpUG+NQ0h+fM5l/av4ehv3FFUpqAjUWfXhgDWmXXcYceTO1zswN7Uaf3Er3HlT
	AhGdNQx52CSJ/75ka8juqIRwwcheeoCVrFSzqQu/KoIfts9bW9Cs8ZvBSQkg3FUV5UOWZxwzt4b
	gGcxavnE2FjPuaLB06ubSQsiYfi0dv2/hn6aRb8gQI37NVMYljtWZlzsolOglN4E6uxQgrg==
X-Received: by 2002:a05:690e:d8b:b0:679:c17e:407a with SMTP id
 956f58d0204a3-67a8d6465a6mr9056359d50.49.1793573526001; Sun, 01 Nov 2026
 14:52:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H> <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H> <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com> <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
In-Reply-To: <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 1 Nov 2026 23:51:55 +0100
X-Gm-Features: AclHuK_A-gwxcDtkBYM_gQIRYpVip7Aj0wblI5gGxYX_krXiPxYiKaGZaOCuxQI
Message-ID: <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Christian Hewitt <christianshewitt@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, christian.koever-draxl@student.uibk.ac.at, 
	neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	khilman@baylibre.com, rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_145207_902359_11806C92 
X-CRM114-Status: GOOD (  31.03  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chuan,

On Thu, Oct 29, 2026 at 6:30=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com> w=
rote:
[...]
> Regarding the concern I mentioned above about supporting a unified
> cpufreq driver across S4, C3, T7, ..., A9, let me explain it in more deta=
il:
>     - These SoCs fall into several hardware architecture categories, and
> I'm wondering whether we could take all of them into consideration and
> implement them in a single amlogic-cpufreq.c, for example:
I think the main question here is: how much code is shared between
various SoC generations.

>       * S4/C3: 1 * cluster
>       * T7: 2 * clusters
>       * S7/S7D/S6: 1 * cluster + DSU
>       * A9: 2 * clusters + DSU (the 2 clusters share one DSU)
>     - For different hardware architectures, the resources that the
> cpufreq driver has to manage also differ and are coupled with each
> other, for example:
>       * S7/S7D/S6: the CPUs and the DSU share a single power rail, and
> the DSU frequency scales proportionally with the CPU frequency
> (typically dsu_clk =3D cpu_clk * 80%)
>       * A9: the resources that A9 needs to manage are relatively more
> complicated ...
>     - Optimizing the cpufreq transition latency:
>       * Clock latency: for most S4/C3/T7 customers, the released bl31.bin
> only supports configuring the CPU clock through SMCs with discrete clock
> rates. Frequent set_rate()/set_parent() calls in the kernel would result
> in a relatively large clock latency, and would cause the sugov thread to
> consume too much CPU time, hurting scheduling performance.
We also support a few more SoC generations upstream:
- Meson8/8b/8m2 (32-bit ARM Cortex-A5/A9) where we need to reparent
the CPU clock to XTAL for stable operating during clock changes (which
should go into a cpufreq driver that implements target_intermediate).
There's no secure monitor or firmware involved for CPU clocks.
- GXBB/GXL/GXM use SCPI firmware CPU clock control so to my knowledge
we're good with what we have (meaning: no custom cpufreq driver
needed)
- G12A single cluster, no DSU: needs a cpufreq driver that implements
target_intermediate (currently it's managed on clock driver side in
kernel space, no firmware involved)
- G12B multi cluster, no DSU: needs a cpufreq driver that implements
target_intermediate (currently it's managed on clock driver side in
kernel space, no firmware involved)
- SM1 single cluster and DSU: needs a cpufreq driver that implements
target_intermediate (currently it's managed on clock driver side in
kernel space, no firmware involved)

[...]
> The amlogic-cpufreq.c as implemented here can indeed cover the case of a
> single cluster with no shared resources, such as S4/C3/T7. However, for
> the upcoming SoCs where multiple clusters share resources, it may not be
> sufficient to cover: for example, on S7/S7D/S6 the CPUs and the DSU
> share one regulator; on A9 the two clusters share the dsu_clk, and the
> sharing relationships among cpu_reg, cpu_sram_reg, dsu_reg and
> dsu_sram_reg are even more complicated. For such cases, extending the
> current amlogic-cpufreq.c would be rather difficult, so we would like to
> make an overall evaluation.
I think you're making a good point why it's fine to have multiple
cpufreq drivers for Amlogic SoCs.
My suggestion instead is to name the driver in this series
amlogic-s4-cpufreq (or similar). From what I understand C3 support
(maybe also T7?) can be easily added to the same driver.
For the 32-bit SoCs I'm planning to implement amlogic-meson8-cpufreq.
I don't know how relevant DSU is on SM1, depending on how tricky it is
support may either go into amlogic-meson8-cpufreq or (a new)
amlogic-meson-g12a-cpufreq.
And for the newer SoCs like S7/S7D/S6/A9/... I trust your instinct on
whether they should be in one driver or multiple.

> We have done a lot of optimization on these issues from both the
> hardware and software sides, and we would like the cpufreq driver we
> submit upstream to cover these optimizations as much as possible. For
> example, the bl31.bin for S4/C3/T7 has already been released, and
> updating bl31.bin may cause extra trouble for customers, so we would
> also like to balance this and see how to minimize the impact.
I agree. I my opinion it would be best to allow the OS (in this case:
Linux) to manage clocks so (closed source) firmware binary blob
updates cannot cause any trouble.


Best regards,
Martin

