Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DDA606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M+43nCWr;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GIZgDQzS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oz29i48u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NjhWI7yuHtG81l8jE2qhNiW4zLmd30RBDdP41eJc7Q0=; b=M+43nCWryw3NLQ
	M+afOQGlWnEz+SwPeS+u/cixQvaWYL3MYtKzt3BXO5rwV8MmewrxbxgY8DdzYALc6fjS1wuiV9tL6
	aVf67EEAFiw6VHTziT18lG/7bkF25CUEdejnHEjGAVwfMGzgvLaIiBojp8Tt/M8tB8cDwPJubMCap
	S8FtLXbg7ADxclK9f1tEcqLDK0RSrlLVi4SRkeRCMzupqc/dmvWACP24pImYeENRa1C0ywd37/I4y
	KLPE+FYqNsbe+dWEcWQs5oS8bvnXTVHEjnWNgSQZJnsPczM/f/Cl/5lQKLYt768+G3xSXBClWUolr
	aCGxDm3S1IGuPhO4fEBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyUz-00000000IAC-355e;
	Mon, 02 Nov 2026 20:19:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyUu-00000000I8e-45KH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:19:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K5vHQ3292393
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 20:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NjhWI7yuHtG81l8jE2qhNiW4zLmd30RBDdP41eJc7Q0=; b=GIZgDQzSKfkAJV+e
	snrUcvoMsxebXxOoVuF+gD6Y6nrIopJm8HZXtfuC+HP+cn5tpURxCiutfm/2wZDs
	RZGmfivmpJrMUVUBxYzZTGBBI2hVlhJr4IsP5AfUCQLfcJyp1u35H1sfs8Zrsq0c
	uXA8wyD5v8qs1uym+HbBX98fbKucCdnLt/20df7nG+pjnlbm3auZ+rvVj2kp2XU1
	yLKK+2AIXGGuEDrEv4NFHCXmmiX0D3NIZRAX/hAuRc4/m4hSznz1XN7lekSrjBVi
	0wb/G3TbMU+1VILShrFEveCHhTQj7Cdt7oNARM+sqUWMU/mZ6zhoNzrPaBw4Q0IT
	pKVfhA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07egba6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:19:16 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso6596842c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793650755; x=1794255555; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NjhWI7yuHtG81l8jE2qhNiW4zLmd30RBDdP41eJc7Q0=;
        b=Oz29i48uJI5IStID+ZDxKgRHzwiCFA+Abop3nCX755Y2r6Uk4+oU8yrtNz3HeSmWYP
         DMQ4hR782hL2WdV+PBbevB6hf2E7QFSttmT9/Z7/JpcpjByGmNnHttyED8+9ogrsdqoq
         uA/6/rrTT+Bl/it8TYVpj3+Awi8JMhKdZ96/ar44rI3BR5NEu51A49mQPdDagZ/QyUBZ
         dDsbRvU2ypIcsutKLw4bYLJHgSPh5kohy8mrITMDlBZFsL0UJzkRUMZS5XfV+WjXp/Mh
         Kb1x9LQGBHYilCcvVmXivQvfqD/rrn/2or2wYc/PMDNLPLEYxY4VaFJngtmiRwBGAFnG
         ZNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650755; x=1794255555;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjhWI7yuHtG81l8jE2qhNiW4zLmd30RBDdP41eJc7Q0=;
        b=xVaQCDH2oTK2Hx9lVKnszrQGJRAYKggGPPSaW0TnhV+NzmkkYV/K1A9OE33Bjz2I0d
         d2QjQMEKWdrUF+pCYhpdAv2tpgMU1Ni9EP7QEdQrodILbj/30joZja5Vy0fxOkkc0RIV
         hP65yPB1bbZ2SL2EJOg2O161ovIipwquPUawJ0xrqnUudr6UUYdlo/yWQBGlyOc5+qju
         E/VA4VdBspjgS9Ld78eorrI+pP+0aSTo51R8QReWujkTxlCMiVlEjOR9T6frFDaQ+0zC
         ngil7W1wDp6q3THnjEdUtABrU3TR3ikHWNa4tMvPaJWBeaLlLePc8tYIHM3GpIpO+oSs
         jXbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjlAKUQBgEsRLSQNIVjAbhc8qEv63ZfpI7JyswyL/9eARLLVjMa1h9iwE/cTg5BvV1HGLsUWizyDc2XKhY5Ydo@lists.infradead.org
X-Gm-Message-State: AFq9FYLeStAsKw5ipkpyoFsBhLpdxUc5O3ChiOaPYYf7YBeOglC3KtlL
	dlEPr42wXga5zabzsfTboK5/jx31hNeTA4cJdyMl8jThfhsh/3vBm9iYtSYR6E5ayLkr4ILIHpf
	51wn1mDAQX9Ys+CbXqAd3kpzmVBoRy/EeOkYuzLut1UgOsDE+ALk7q9HiBhgYC30LCGb1T7vB8E
	ZYdA==
X-Gm-Gg: AYBFou3HQIPCshPZmbbn95xbX8Fm3ShXk9ZFgyVPKpnkQYjkbuuKCZbBj3WzK0pPv9m
	d1sUmMkhaKfGCPzQZx+KvOkTIcSDM0siwGmvILpW+BhoxvsfHpY9PbuJWD7F/jhYOe6TLtV1VzN
	gYYpva5XU0I3DeVWBuGTJN1ANSpfuFL+KYAFp+gq0NvK/2DlfhaZ/ozQhbM2rRlElWNKeV6DX6V
	1XekmFb+H3heatbZUDqhGMK0Tt/j9qA4pdmrUVbo0fPx6rBMRSsTl8TfFe0/GMvppsejTv3fq7U
	UoZxLkZknk/bQtfVUI/SMm7RG8f10hyzDNVrhKaan8vzPGVU6qP7E9X1JX9neJIW7ZESF8xU6kz
	xpJRvmBGc+UVdyXAbTmIxmNrWUhta1LuSb8n4gVZVYWmZzr07xh5QzlHBb96+5JffjnYFDvYlaW
	opwOr1pJutexgHsYMcuE9SJ5PIHhw=
X-Received: by 2002:a05:701b:260c:b0:1ac:9ecb:acee with SMTP id a92af1059eb24-1ac9ecbb353mr14134667c88.39.1793650755281;
        Mon, 02 Nov 2026 12:19:15 -0800 (PST)
X-Received: by 2002:a05:701b:260c:b0:1ac:9ecb:acee with SMTP id a92af1059eb24-1ac9ecbb353mr14134615c88.39.1793650754462;
        Mon, 02 Nov 2026 12:19:14 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm35173057c88.23.2026.11.02.12.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:19:13 -0800 (PST)
Date: Mon, 2 Nov 2026 12:19:02 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "santino.wang" <santino.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
        <arnab.layek@mediatek.com>, Tony Luck <tony.luck@intel.com>,
        Borislav
 Petkov <bp@alien8.de>
Subject: Re: [RFC PATCH 08/11] soc: mediatek: dram-ecc: add the corrected
 error leaky bucket
Message-ID: <20261102121902.00004630@oss.qualcomm.com>
In-Reply-To: <20261102092334.138759-9-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	<20261102092334.138759-9-santino.wang@mediatek.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4MCBTYWx0ZWRfX8spydWQWCH47
 p8LauZB86kPqG1fxWwzGIgd9UrGzUhpXb/Pyu0AhETDsXPfQLu2fljifxYIWgNScK5nFKel8c1d
 oPscjxPLorPpcuQqNUTeGYkrv3EvT0M1tmKblK1fquP7BX9yXxa8967LFEudqKRDXjS+zuBuf6i
 KHkT4py+3d8T29Vrw4DP5Okzlj1ckYxHZeErWcwNZVjopiLGj8GdCwfpXxAneXo/vdcK2r8ajzU
 mnu9KDMHuGd1WhxOupGcXYFBEr0McDVHeYkUfuecaGyN34ImmKhSaMVcpf/NlvPTrck/+AYEjd3
 qCN5MHaifKI1ThmXJ/vHA+nZNqH4mLVXxkBJLbLAiSgKDu9P+fnR3c4ebva1WUfp/ZP6Gsd/zjU
 cEj2R13z6wx4Pgavqu5MKCzADxUOnL1fbYR9eNCgPPlRVX4Y1RUPA6cA+Ol+Eh0oKjDaHR55VQ2
 46waXQwdNyOApDhf3wg==
X-Proofpoint-ORIG-GUID: EhCdaPdkaQ-JKn-XdmL6yg1EizKXv9eg
X-Proofpoint-GUID: EhCdaPdkaQ-JKn-XdmL6yg1EizKXv9eg
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae8f044 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=mpaa-ttXAAAA:8 a=AaPcPOS3PQYIbfi2GmAA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4MCBTYWx0ZWRfX+qddVs5PXnff
 qjLCKgxW0LpkK3YO/1CTZrUkfsXsYqiLnXITMbHvyc0TOrYsu6k/sw0JWbFJboE/P25Y3g09ccv
 0hsE5B9v9ffhFjD2+49R9XijsBVZ618=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_121919_778135_9B3FA555 
X-CRM114-Status: GOOD (  34.46  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 17:23:30 +0800
santino.wang <santino.wang@mediatek.com> wrote:

> From: Santino Wang <santino.wang@mediatek.com>
>=20
> A page with repeated corrected errors is likely to fail. Count the
> corrected errors per page in a leaky bucket and retire the page with
> memory_failure() when the count reaches a threshold. The bucket decays
> over time, and its threshold, decay interval and the number of tracked
> pages are configurable through sysfs.

Other than registering on your own record (that replicates
the standard one as far as I can tell) what does this bring you over
the stuff that edac provides already or can be done easily in
userspace? (where in my view most policy related stuff should be!)
=46rom my initial read I think this patch set needs a lot more
explanatory description and comparison with existing infrastructure.
Not to mention send it to the edac maintainers and mailing list.

Just so they are in the loop I've +cc Tony and Borislav

Jonathan

>=20
> Signed-off-by: Santino Wang <santino.wang@mediatek.com>
> ---
>  drivers/soc/mediatek/dram-ecc/core/Makefile   |   1 +
>  .../mediatek/dram-ecc/core/ghes_notifier.c    |   2 +
>  .../dram-ecc/core/policy/leaky_bucket.c       | 277 ++++++++++++++++++
>  .../mediatek/dram-ecc/core/policy/policy.c    |   9 +-
>  .../mediatek/dram-ecc/core/policy/policy.h    |   4 +
>  5 files changed, 292 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucke=
t.c
>=20
> diff --git a/drivers/soc/mediatek/dram-ecc/core/Makefile b/drivers/soc/me=
diatek/dram-ecc/core/Makefile
> index d8d878f321d4..7c973831c9ef 100644
> --- a/drivers/soc/mediatek/dram-ecc/core/Makefile
> +++ b/drivers/soc/mediatek/dram-ecc/core/Makefile
> @@ -12,6 +12,7 @@ mtk_dram_ecc-y :=3D \
>  	policy/policy.o \
>  	policy/containment.o \
>  	policy/storm_protection.o \
> +	policy/leaky_bucket.o \
>  	policy/address_range.o
> =20
>  CFLAGS_trace.o :=3D -I$(src)
> diff --git a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c b/drivers=
/soc/mediatek/dram-ecc/core/ghes_notifier.c
> index 633bf89e2231..a010ca652e86 100644
> --- a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
> +++ b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
> @@ -28,6 +28,7 @@
>  #include "mtk_dram_ecc_event.h"
>  #include "ghes_notifier.h"
>  #include "counters.h"
> +#include "policy/policy.h"
>  #include "trace.h"
> =20
>  static ATOMIC_NOTIFIER_HEAD(mtk_dram_ecc_notifier_chain);
> @@ -249,6 +250,7 @@ static int mtk_ghes_vendor_cb(struct notifier_block *=
nb, unsigned long severity,
>  		spin_unlock(&addr_lock);
>  		trace_mtk_dram_ecc_ce(evt.spa, evt.channel, evt.subchannel, evt.rank,
>  				      evt.bank, evt.row, evt.column);
> +		leaky_bucket_hit(evt.spa);
>  		ret =3D atomic_notifier_call_chain(&mtk_dram_ecc_notifier_chain,
>  						 MTK_DRAM_ECC_NOTIFY_CE, &evt);
>  		if (ret =3D=3D NOTIFY_BAD)
> diff --git a/drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucket.c b/d=
rivers/soc/mediatek/dram-ecc/core/policy/leaky_bucket.c
> new file mode 100644
> index 000000000000..a51793d53efb
> --- /dev/null
> +++ b/drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucket.c
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026 MediaTek Inc.
> + */
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +#include <linux/string.h>
> +#include <linux/hashtable.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/workqueue.h>
> +#include <linux/mm.h>
> +#include <linux/jiffies.h>
> +#include <linux/errno.h>
> +#include <linux/printk.h>
> +
> +#include "../counters.h"
> +#include "../mtk_dram_ecc.h"
> +#include "../trace.h"
> +#include "policy.h"
> +
> +/* ------------------------------------------------------------------ */
> +/* Per-page counter table                                               =
*/
> +/* ------------------------------------------------------------------ */
> +
> +struct lb_entry {
> +	struct hlist_node node;
> +	u64 pfn;
> +	u32 count;
> +};
> +
> +#define LB_HASH_BITS 8   /* 256 buckets */
> +
> +static DECLARE_HASHTABLE(lb_table, LB_HASH_BITS);
> +static DEFINE_SPINLOCK(lb_lock);
> +static unsigned int lb_tracked;  /* number of entries currently in table=
 */
> +
> +/* ------------------------------------------------------------------ */
> +/* Decay timer (delayed_work)                                           =
*/
> +/* ------------------------------------------------------------------ */
> +
> +static struct delayed_work lb_decay_work;
> +
> +static void lb_decay_fn(struct work_struct *work)
> +{
> +	struct lb_entry *e;
> +	struct hlist_node *tmp;
> +	unsigned int bkt;
> +	bool reschedule =3D false;
> +
> +	spin_lock(&lb_lock);
> +	hash_for_each_safe(lb_table, bkt, tmp, e, node) {
> +		if (e->count > 0)
> +			e->count--;
> +		if (e->count =3D=3D 0) {
> +			hash_del(&e->node);
> +			kfree(e);
> +			lb_tracked--;
> +		} else {
> +			reschedule =3D true;
> +		}
> +	}
> +	spin_unlock(&lb_lock);
> +
> +	if (reschedule)
> +		schedule_delayed_work(&lb_decay_work,
> +				      secs_to_jiffies(mtk_ecc_data.lb_decay_interval_sec));
> +}
> +
> +/* ------------------------------------------------------------------ */
> +/* leaky_bucket_hit - called from ghes_notifier.c on every CE event    */
> +/* ------------------------------------------------------------------ */
> +
> +void leaky_bucket_hit(u64 spa)
> +{
> +	u64 pfn =3D spa >> PAGE_SHIFT;
> +	struct lb_entry *e;
> +	bool found =3D false;
> +	bool start_timer =3D false;
> +	bool retired =3D false;
> +	u32 count =3D 0;
> +	int ret;
> +
> +	spin_lock(&lb_lock);
> +
> +	hash_for_each_possible(lb_table, e, node, pfn) {
> +		if (e->pfn =3D=3D pfn) {
> +			e->count++;
> +			count =3D e->count;
> +			found =3D true;
> +			break;
> +		}
> +	}
> +
> +	if (!found) {
> +		if (lb_tracked < mtk_ecc_data.lb_max_tracked) {
> +			e =3D kzalloc_obj(*e, GFP_ATOMIC);
> +			if (e) {
> +				e->pfn   =3D pfn;
> +				e->count =3D 1;
> +				count    =3D 1;
> +				hash_add(lb_table, &e->node, pfn);
> +				lb_tracked++;
> +				/* start timer only when table was empty */
> +				if (lb_tracked =3D=3D 1)
> +					start_timer =3D true;
> +			}
> +		}
> +	}
> +
> +	spin_unlock(&lb_lock);
> +
> +	if (start_timer)
> +		schedule_delayed_work(&lb_decay_work,
> +				      secs_to_jiffies(mtk_ecc_data.lb_decay_interval_sec));
> +
> +	if (count >=3D mtk_ecc_data.lb_threshold && mtk_ecc_data.lb_threshold >=
 0) {
> +		ret =3D memory_failure(pfn, 0);
> +		if (ret =3D=3D 0 || ret =3D=3D -EHWPOISON) {
> +			mtk_dram_ecc_record_retired_page(pfn,
> +							 MTK_DRAM_ECC_RETIRE_CE,
> +							 ret);
> +			retired =3D true;
> +		} else {
> +			pr_warn_ratelimited("mtk-dram-ecc: CE page isolation failed: pfn=3D0x=
%llx ret=3D%d\n",
> +					    pfn, ret);
> +		}
> +	}
> +
> +	trace_mtk_dram_ecc_page_retire(pfn, count, mtk_ecc_data.lb_threshold,
> +				       retired);
> +}
> +
> +/* ------------------------------------------------------------------ */
> +/* sysfs                                                                =
*/
> +/* ------------------------------------------------------------------ */
> +
> +static struct kobject *leaky_bucket_kobj;
> +
> +#define MTK_ECC_LB_THRESHOLD_MAX		10000U
> +#define MTK_ECC_LB_DECAY_INTERVAL_MAX	86400U
> +#define MTK_ECC_LB_MAX_TRACKED_MAX	16U
> +
> +static ssize_t threshold_show(struct kobject *kobj, struct kobj_attribut=
e *attr,
> +			      char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", mtk_ecc_data.lb_threshold);
> +}
> +
> +static ssize_t threshold_store(struct kobject *kobj, struct kobj_attribu=
te *attr,
> +			       const char *buf, size_t count)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret =3D kstrtou32(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +	if (val =3D=3D 0)
> +		val =3D MTK_ECC_LB_THRESHOLD_DEFAULT;
> +	else if (val > MTK_ECC_LB_THRESHOLD_MAX)
> +		return -EINVAL;
> +
> +	mtk_ecc_data.lb_threshold =3D val;
> +	return count;
> +}
> +
> +static ssize_t decay_interval_sec_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", mtk_ecc_data.lb_decay_interval_sec);
> +}
> +
> +static ssize_t decay_interval_sec_store(struct kobject *kobj,
> +					struct kobj_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret =3D kstrtou32(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +	if (val =3D=3D 0)
> +		val =3D MTK_ECC_LB_DECAY_INTERVAL_DEFAULT;
> +	else if (val > MTK_ECC_LB_DECAY_INTERVAL_MAX)
> +		return -EINVAL;
> +
> +	mtk_ecc_data.lb_decay_interval_sec =3D val;
> +	return count;
> +}
> +
> +static ssize_t max_tracked_show(struct kobject *kobj,
> +				struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", mtk_ecc_data.lb_max_tracked);
> +}
> +
> +static ssize_t max_tracked_store(struct kobject *kobj,
> +				 struct kobj_attribute *attr,
> +				 const char *buf, size_t count)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret =3D kstrtou32(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +	if (val =3D=3D 0)
> +		val =3D MTK_ECC_LB_MAX_TRACKED_DEFAULT;
> +	else if (val > MTK_ECC_LB_MAX_TRACKED_MAX)
> +		return -EINVAL;
> +
> +	mtk_ecc_data.lb_max_tracked =3D val;
> +	return count;
> +}
> +
> +static struct kobj_attribute threshold_attr =3D
> +	__ATTR(threshold, 0644, threshold_show, threshold_store);
> +static struct kobj_attribute decay_interval_sec_attr =3D
> +	__ATTR(decay_interval_sec, 0644, decay_interval_sec_show, decay_interva=
l_sec_store);
> +static struct kobj_attribute max_tracked_attr =3D
> +	__ATTR(max_tracked, 0644, max_tracked_show, max_tracked_store);
> +
> +static struct attribute *attrs[] =3D {
> +	&threshold_attr.attr,
> +	&decay_interval_sec_attr.attr,
> +	&max_tracked_attr.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group group =3D {
> +	.attrs =3D attrs,
> +};
> +
> +/* ------------------------------------------------------------------ */
> +/* init / exit                                                          =
*/
> +/* ------------------------------------------------------------------ */
> +
> +int leaky_bucket_init(struct kobject *parent)
> +{
> +	int ret;
> +
> +	hash_init(lb_table);
> +	INIT_DELAYED_WORK(&lb_decay_work, lb_decay_fn);
> +
> +	leaky_bucket_kobj =3D kobject_create_and_add("leaky_bucket", parent);
> +	if (!leaky_bucket_kobj)
> +		return -ENOMEM;
> +
> +	ret =3D sysfs_create_group(leaky_bucket_kobj, &group);
> +	if (ret) {
> +		kobject_put(leaky_bucket_kobj);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +void leaky_bucket_exit(struct kobject *parent)
> +{
> +	struct lb_entry *e;
> +	struct hlist_node *tmp;
> +	unsigned int bkt;
> +
> +	cancel_delayed_work_sync(&lb_decay_work);
> +
> +	spin_lock(&lb_lock);
> +	hash_for_each_safe(lb_table, bkt, tmp, e, node) {
> +		hash_del(&e->node);
> +		kfree(e);
> +	}
> +	lb_tracked =3D 0;
> +	spin_unlock(&lb_lock);
> +
> +	sysfs_remove_group(leaky_bucket_kobj, &group);
> +	kobject_put(leaky_bucket_kobj);
> +}
> diff --git a/drivers/soc/mediatek/dram-ecc/core/policy/policy.c b/drivers=
/soc/mediatek/dram-ecc/core/policy/policy.c
> index ecd0a430de6d..5a4181b8de7d 100644
> --- a/drivers/soc/mediatek/dram-ecc/core/policy/policy.c
> +++ b/drivers/soc/mediatek/dram-ecc/core/policy/policy.c
> @@ -26,12 +26,18 @@ int mtk_dram_ecc_policy_init(struct device *dev)
>  	if (ret)
>  		goto err_containment;
> =20
> -	ret =3D address_range_init(policy_kobj);
> +	ret =3D leaky_bucket_init(policy_kobj);
>  	if (ret)
>  		goto err_storm;
> =20
> +	ret =3D address_range_init(policy_kobj);
> +	if (ret)
> +		goto err_leaky_bucket;
> +
>  	return 0;
> =20
> +err_leaky_bucket:
> +	leaky_bucket_exit(policy_kobj);
>  err_storm:
>  	storm_protection_exit(policy_kobj);
>  err_containment:
> @@ -44,6 +50,7 @@ int mtk_dram_ecc_policy_init(struct device *dev)
>  void mtk_dram_ecc_policy_exit(struct device *dev)
>  {
>  	address_range_exit(policy_kobj);
> +	leaky_bucket_exit(policy_kobj);
>  	storm_protection_exit(policy_kobj);
>  	containment_exit(policy_kobj);
>  	kobject_put(policy_kobj);
> diff --git a/drivers/soc/mediatek/dram-ecc/core/policy/policy.h b/drivers=
/soc/mediatek/dram-ecc/core/policy/policy.h
> index a535e2ce0e6d..c9926cbc11be 100644
> --- a/drivers/soc/mediatek/dram-ecc/core/policy/policy.h
> +++ b/drivers/soc/mediatek/dram-ecc/core/policy/policy.h
> @@ -13,6 +13,10 @@ void containment_exit(struct kobject *parent);
>  int storm_protection_init(struct kobject *parent);
>  void storm_protection_exit(struct kobject *parent);
> =20
> +int leaky_bucket_init(struct kobject *parent);
> +void leaky_bucket_exit(struct kobject *parent);
> +void leaky_bucket_hit(u64 spa);
> +
>  int address_range_init(struct kobject *parent);
>  void address_range_exit(struct kobject *parent);
> =20


