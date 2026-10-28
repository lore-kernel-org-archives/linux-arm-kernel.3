Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B52606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zrbCNdNi;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NaRXsftu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fNNHRodU41vyHJ/yGqrIn2TFntyAumGGltE3jgUaaDQ=; b=zrbCNdNitGM9x9C3uMCls57z5N
	0vAteahHNjTx5cJOIhj85KvfaOjjuEAmgnNEPxkCCMlTEaskwEuYxsmMjsLAkoVxLyWeBHeNbk3VM
	h9vxVLmSGJ2wYxeylQPs7+gTuc+iLRjeADaiFPP3KVMD4aeudJwCIhnYwu8nSyJHIp2o0YykHHq/a
	FOY/Rquj++xFH64CkCRqaqfWSVwLXtOLy6xW0Dk822fHgqXME+RTk/S4pR42fefspBmaSYubic/JI
	CSsK99VzIsi7zn6CjodyA9PUkCrARAKHzSN7Qr7xYxtgvGx19uLzKEmH3LFUl/orRjKxGgxuqf++0
	zzJbKQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM487-000000078Mb-0Xuj;
	Wed, 28 Oct 2026 13:55:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM485-000000078MU-1uGN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:55:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 32B8C43957;
	Wed, 28 Oct 2026 13:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C3B1F01825;
	Wed, 28 Oct 2026 13:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793195749;
	bh=fNNHRodU41vyHJ/yGqrIn2TFntyAumGGltE3jgUaaDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NaRXsftueCDPsswZ2j1ClUitl2cw3/aLfx56YMFaZeAztXW5hEaT/YlmmaYG1ZgIA
	 v10DSHVNzZTE0VsyQgfXEfYa1DABKO9RPYe8lmmqhvO+GyPnTyztWuGvOUNKI/f0R8
	 p3s1OSGaahMCDRmSz9Dw2kSBHFy2nnTBGDuEgIX7iaQ4iRW9YtFomhKhCKb0weJn7H
	 wy0yKPMczEh8HDJXDja9ackemDjBWpTWeQo2Xw9BpmwzefqEP7FNplsg1+DxgYrSRs
	 POcYeau9G1FTlxWoHlrNptL/mKkUFx4hDHvrI4bxu+9zSuBSvJJmQOO99kQ53u+Ve1
	 3pq3YUplcBGag==
Date: Wed, 28 Oct 2026 13:55:46 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/3] firmware: arm_scmi: imx: Track copied syslog words
Message-ID: <20261028-rousing-spiritual-harrier-fbcbe7@sudeepholla>
References: <20261028130502.2999676-1-sudeep.holla@kernel.org>
 <auH9VafGSnYCRlUz@shlinux89>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auH9VafGSnYCRlUz@shlinux89>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 09:49:09PM +0800, Peng Fan wrote:
> On Wed, Oct 28, 2026 at 01:05:00PM +0000, Sudeep Holla wrote:
> >The MISC syslog iterator records the number of returned words plus
> >firmware-reported remaining words in the caller's size output.
> >
> >The debugfs consumer uses that value to dump its fixed-size buffer. A
> >malformed or inconsistent response can therefore make it read beyond
> >the copied data and allocation.
> >
> >Return the accumulated number of words copied into the caller's buffer
> >instead. The generic iterator bounds this count to the initial buffer
> >capacity before processing each response.
> >
> >Reported-by: Sashiko <sashiko-bot@kernel.org>
> >Closes: https://sashiko.dev/#/bug/linux-c3c9437c-ba1a-4db6-837f-cb0950d89018
> 
> This should be: https://sashiko.dev/#/bug/linux-67e325a9-473e-450a-a2a0-bf4c0c720624
>

Thanks, my bad copy-paste error. Thought it was copied but no 😢.

> >Fixes: 4fa62e80c7db ("firmware: arm_scmi: imx: Support getting syslog of MISC protocol")
> >Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> 

Thanks!

-- 
Regards,
Sudeep

