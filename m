Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DB0D39000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+GzhEB3tryEr+JL1CkKR8i+GAo7vGKj/DIOKGFcAeY=; b=Rxy8uk2TEy6CPzB0rIaGJsuTR4
	CYsj/wHHsmUOaX7o+lSgK50qFCwrPnAEDQaIHkRKxkH0/KTM6hN3JnxY9wEvcIhN5IJxlYl8yETvA
	yDS8yOmWSp/2TcB1RIQCGX+v1aa6BwqxSIA/rmckNB1rCkD++vm1mRmPaENSUb+zjfLbCWCDUNvW4
	10Ofj3iAyWmCKqKoV91rnlwOBc9USCv9NTVXuh9n6E4Ub8bZmHT31tCz5IH3UP+NqGPljZxH3oUK2
	G11gL/BQ9fIymcAEGLJrVz+2Qh+DIhvVemAWXh2/J9Alb9n93aFhJmr6dujE9jcO/IA9eOIPekqV4
	eNe5JlHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg52w-0000000ADp6-3zqr;
	Wed, 14 Jan 2026 17:52:42 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg52u-0000000ADoA-0c0k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:52:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1768413125; x=1769017925; i=markus.elfring@web.de;
	bh=4+GzhEB3tryEr+JL1CkKR8i+GAo7vGKj/DIOKGFcAeY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kbU4u535kWEOaVqR/4eqIHaX8i/jVHYgSg3KyE7BNOXIE05A67H/5hi/+SLbEwYd
	 XCZiigIhJPInFCe4mjmfoHwVaWKh+htKI3dl9u2flGp5ZIwSdEepawXJPiAGyCHVC
	 AaZ32dt2LsnDfVt13iienaN+uVNAs1fzL/GdaOEqSwKm6Tk1zEZ+jjwOzDnb8slOr
	 6n2UDY9jgRl4B/+QJwit6o7baE6n6ySgaJiWZn5RB1pRZoeA/GR/BkCZotSYPEG3h
	 DwGVxXVyl9rX5BnYAdspIIYk6VblCejuTH9lTOE3QP07JLFxg6QKcrMwcwXeteRMH
	 B/qztrmsAhOwtimmww==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.218]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1McIga-1wGFCb2Gp2-00eLSM; Wed, 14
 Jan 2026 18:52:05 +0100
Message-ID: <b356d642-6cb9-4c64-a66e-26b6e6fcd19c@web.de>
Date: Wed, 14 Jan 2026 18:51:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org
Cc: LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
 Andrei Aldea <a-aldea@ti.com>, "Andrew F. Davis" <afd@ti.com>,
 Chirag Shilwant <c-shilwant@ti.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Jonathan Humphreys <j-humphreys@ti.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Nishanth Menon <nm@ti.com>,
 Oded Gabbay <ogabbay@kernel.org>, Randolph Sapp <rs@ti.com>,
 Rob Herring <robh@kernel.org>, Robert Nelson <robertcnelson@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Tero Kristo <kristo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20260114-thames-v2-4-e94a6636e050@tomeuvizoso.net>
Subject: Re: [PATCH v2 4/5] accel/thames: Add IOCTL for job submission
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260114-thames-v2-4-e94a6636e050@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TujjZXhmNMoZ1C2MKWjZBB0J/Wckqor+l9zn0S9SlMmQfuiPc3x
 1s4kZqogPv1gWJVV75dUuJNVM4tv7lhcndMfiXfvIAVVqJ7s0gMS7Tk+9N+i9J0SJAXh8NO
 oxD642sDFoFgGfernCSwE/BRtbXSKdk5VwEHfjEIyceEZubz+4f9OAq+Mz5leYHW1ChBAQW
 FTkKrvlRF2U++Y2lDtPnQ==
UI-OutboundReport: notjunk:1;M01:P0:k91x8d4JPJk=;GMmbe1mCKTZLlg3zBtMEhc8Gq7g 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 Z4UmZG/kFv+KPkTxUpt+JTlSYq5iWH3QsecMPP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_095240_990988_C9E96E66 
X-CRM114-Status: UNSURE (   6.39  )
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

=E2=80=A6
> +++ b/drivers/accel/thames/thames_job.c
> @@ -0,0 +1,463 @@
=E2=80=A6
> +static int thames_job_push(struct thames_job *job)
> +{
=E2=80=A6
> +	dev_dbg(tdev->ddev.dev, "Pushing job with %u in BOs and %u out BOs\n",=
 job->in_bo_count,
> +		job->out_bo_count);
> +	bos =3D kvmalloc_array(job->in_bo_count + job->out_bo_count, sizeof(vo=
id *), GFP_KERNEL);
> +	memcpy(bos, job->in_bos, job->in_bo_count * sizeof(void *));
=E2=80=A6

Why was error detection for a memory allocation failure omitted (or overlo=
oked)
so far at this source code place?

Regards,
Markus

