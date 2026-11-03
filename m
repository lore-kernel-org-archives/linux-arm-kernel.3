Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141736082BDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hZdCvCB9;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dvkWm0DS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8gvrtFNaPF85MZnIqWG775YGSTQ1q4Yj1NpyoCXwkzo=; b=hZdCvCB9mu3dpAD7xU6HBU1UqA
	zMGZ4TAw+2IB4qcpfHYuHg4XL20r41vf5Gfvztqrb2xGERI8YEQzrr5ALCmJWjKp2L1YPJ6Tz9vX4
	cUNQawUeoZtZOMZnR474qQpI2KkcHy8IEi+IpYv2tRVZLpE5d0Mc58H12iacJOqdd7rtWNhmsmm64
	uT3fYdE36n8uo+CyZajv7ZVJ9ykZKDFYfcDh1KbH4PwnD8s3rZUpmEULKLkMt+VhJsTp5wfV+iyth
	DBosKgkkUMvrE9kvZggvK7uR/0YEPcnDfuXNcGIjhhYquGAdZu5KHbwoWjC5kk+WP2JVxFxj37C1M
	1gsuESkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAi0-00000001jTB-0giI;
	Tue, 03 Nov 2026 09:21:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAhr-00000001jRu-2Por;
	Tue, 03 Nov 2026 09:21:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DB2841A19;
	Tue,  3 Nov 2026 09:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D670C1F00A16;
	Tue,  3 Nov 2026 09:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793697687;
	bh=8gvrtFNaPF85MZnIqWG775YGSTQ1q4Yj1NpyoCXwkzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dvkWm0DSi6XmsJWdmyTJtm+nVGXM0H78lqGG2zM3ZREVdxtR72ptzmW5hja5TBBpg
	 acaXrR+fECf4WjuTaqgZMX0Jm7ll39uDgtqdqQE4zXms4Nltc2XbGygFuG72yMgWVC
	 dD6w5h5wqhEtv/r9w7tHj93PqIkr7JzncW5srFKmSqrnpNLDz5WWpVKfEdW386REGj
	 G5feJqXR+oZyfTEy0yL7stNh7MBSJF7T0TFubl7keW8Do/pDOvyUqOLFnk9ufAVGcR
	 KGylFueE8W4tDwAW/xnNy+SvbHuxZh/fm6N1reApBXGIc7ZZMSpTI+PY+G2AS2anAE
	 mx6Kds5LXs9QQ==
Date: Tue, 3 Nov 2026 10:21:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, 
	yunfei.dong@mediatek.com, stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mediatek: vcodec: Free encoder controls when
 setup fails
Message-ID: <20261103-authentic-manipulative-shrew-ea455b@quoll>
References: <20261103083533.1176842-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103083533.1176842-1-vulab@iscas.ac.cn>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 03 Nov 2026 08:35:33 +0000, Wentao Liang wrote:
> mtk_vcodec_enc_ctrls_setup() can fail after creating some controls. On
> that error, fops_vcodec_open() jumps past the control handler cleanup and
> frees the context, leaking the handler's controls and allocation.
> 
> Use the same control handler cleanup as the later m2m context creation
> failure, and remove the now-unused label. No m2m context is released on
> this path because its initialization has not been attempted yet.
> 
> Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c      | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof





