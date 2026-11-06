Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D8B606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1b9jkgKj;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YLd5i5wD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6ysUKDhkycj13Q2P+bjvds2QR5Xb4PbnZNX+l6BEN+k=; b=1b9jkgKjvALq9hV3VGyE8Wu9N4
	kzhqpE8242qSc7S5B8xSUhkyzO/4FnWV5V2Ys4idsWeMrGlmZ2poD8l02t7xQifY76t07AD+tBHma
	h7A9PD3g8AGdqLOJHhNvWBpLOMfiTv/N0LncX3uuzRzQJijDsTSYCFGrrlYya+3MJvi3rQOiEiUle
	vxdjdpUC2Ll6vzENyNd3mfF+2aE7kqHRpNJyWIQ0UMImoU7Oj7gIbZLvG9T3WrCo/UmOhimqEgxem
	oHYtn/9248O0h4sdKP7fvquKst6yBz8rtqwDel+3j2P0Ciz2d+6Rq3TWEnnU2aX8KDwhtGkyRasUL
	5K9Z0KwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHRk-0000000BzRn-0F18;
	Fri, 06 Nov 2026 10:45:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHRg-0000000BzQQ-2saF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:45:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a215e64962so5094665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 02:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793961918; x=1794566718; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ysUKDhkycj13Q2P+bjvds2QR5Xb4PbnZNX+l6BEN+k=;
        b=YLd5i5wDULkPRs0JEdkczjI8nP2KvlJY4P5llkeF2qkzYX/M9VtbUEpMFPXCkmfjdf
         fV21VTgLT8oefJZKFGRJBcZkQ+0C5RREEoXXd+PVa6EvHeFrMrZjyqHQcyAzcxOk3erj
         v1HmpPpcYJAP9hWto1YWjkG1AcSIbaS4YpAIFgIpZ+bLkio5+Cp+5L5rNQklkWtWWCup
         8QRqFQf6TqqpZLXqyTwqFlUnBRoczaoe+1GdNUxq7b6nrz7MadeIb733ihzohGeCObAV
         Mz1rUOzHhK+Tl0xv4iyR7sYc0HQO2bCkBUIqEHZY7VM3g6MhlIFbc8e5nPdhw8n64ZJt
         fLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793961918; x=1794566718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ysUKDhkycj13Q2P+bjvds2QR5Xb4PbnZNX+l6BEN+k=;
        b=tIur0C9opiKrHBTKfaGw1DdMAfyfRPlh6nUKiVtg4Vl9LlCUMWSAZnX7lkml55eOVl
         G1PLSfGLOClQnDsVccZfYki3RPp/bZz/DGzA9Zi7A9ITKatJ0WIt2g8oqlD8uS5ShLfs
         T+XRtLc45Ua+NNv56KfL+UE3UwDshHFO6XgzoxjqAJzyKL7FUSBNl4k7b3o72r2H/ebr
         3+A1qTOEOUcd4wajhplyhB+mLLAMXjBf9b/Qv5cc7x5Tsi3gfJlS5bF/f6CZXovt8dLk
         VzkkYCfHzaTAed8KekQFt0p8+uZ0Rxh5pK5PynZEp0R+/U+E7fW+EcwV/UFnHpxyouqt
         hWiw==
X-Forwarded-Encrypted: i=1; AKwUvByRhd7CpZ+wVdkMjUbFapD9o5t1A0K+dpwE5STIltaM8Q+/yx6Pym6W2f+VnU1vg5rFtxu3Ato4Ga5zLyvvN4DQ@lists.infradead.org
X-Gm-Message-State: APuU4Z945eKiVOTK5jvxfo9u61EmzmQ+6Adda4L9Eddloaz80fQ9wci6
	j3E6XYks/y+LoSdKRZFjHarunXQUe+D08MFtaOnK1LPIHPSys2Oz1c3/DvYHg4CcoA==
X-Gm-Gg: AYBFou0GskEAeJYU9wuJ5B28mGfDheeAR6vMNZWpJ0PbRUiTKKDXhdWgjPMv4CvTZHJ
	E4rbCLekwQYkwXiJt9zn95bBsSmuc02x7XJLQLjtJB0CFy8+XxyG2Ol7V0Qt+4jhRQxllDcOSma
	JCjnaixsp/c+tTJkGwl4ZItOZYcmi7q9/6wtzeMSG+yNgZb4Ymx+QPIxbq4FER9IP3EjnKLdD17
	ybRC/nw2trw3hAM4baN4zOBJ+cd+RUS6TSQgdJEcv8/4Ml7o3b41lkaLoc3PudBlphZ1mVXwab7
	H897bTFX7BZR0/oVurjdhKr3Qql7zC9EvjBHMZTV2JEudy5hcZnoKKdy6vffODjMZcqlXjO4/xb
	Q8RW6O6YtZRM9hTm4h0KZscMCURVR1wrfORRd9zbfkgjYFjCy/ukCfEuSL+xfMZF5aHBVpglH4i
	DptKmPe3doxiYU5W9hb/s+WzufN0YDgS3GprJ6f4txhMv9uB6fdVR6UyDZURRksGuk/1l/5PFbH
	hNjvSGpSdtR/zilJjBh0ozoW/u030YYc7oedz5rd8DnJT8MVtg1IqrgXRxNZbpyfCmnZ7Kp3FQN
	AnkM2AYjGnQ82HJ29UDmv0KHHS2c0nsqbYRM59HykHmMqOFIOM7uSBn8dV25h0DV
X-Received: by 2002:a05:600c:3b02:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4b6df5eab2emr32006075e9.20.1793961917300;
        Fri, 06 Nov 2026 02:45:17 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b73d28cb10sm16111895e9.0.2026.11.06.02.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:45:14 -0800 (PST)
Date: Fri, 6 Nov 2026 10:45:09 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Will Deacon <will@kernel.org>, brendan.jackman@linux.dev,
	catalin.marinas@arm.com, rppt@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, ardb@kernel.org, thierry.reding@kernel.org,
	david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <au2vtZFyfUVWeils@google.com>
References: <are21BjeS1O3RYE3@sumit-xelite>
 <aruh86rd5FMv2i9G@willie-the-truck>
 <ar5TPvANFUoosxGW@sumit-xelite>
 <asOAYODGZa-7EIV1@google.com>
 <asOD31rTX6dNfD1o@google.com>
 <aszdnInyJxLhSQRp@sumit-xelite>
 <as3798SFCfKFirag@google.com>
 <as4ATqhp0bPI03PA@sumit-xelite>
 <auILvMVSXk9pZh6M@google.com>
 <auQ5hCdPFz0BmvDG@sumit-xelite>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auQ5hCdPFz0BmvDG@sumit-xelite>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024520_777144_F7DA53D0 
X-CRM114-Status: GOOD (  24.96  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

[...]

> > > Yeah I saw that constraint too, let's leave it for future extension
> > > then although having this reordering dependency fixed will be ideal.
> > > 
> > > >
> > > > So the only case it would work would be when a reserved memory has set
> > > > "linux,cma-default".
> > > >
> > > 
> > > Let's rather just turn DT based default CMA pool to support PTE-level
> > > mapping and keep it configurable via Kconfig or cmdline or DT.
> > 
> > If we need a DT declaration anyway, a Kconfig and a cmdline option aren't really
> > necessary.
> 
> Agree, it rather makes sense for DT independent generic CMA pool.
> 
> > 
> > Also, Rob wasn't very keen on having a DT option for the reserved memory and
> > suggested to have a compatible string instead [1]. So perhaps we could have a
> > a separate driver that handles the unmapping.
> > 
> > 	linux,cma {
> > 		compatible = "shared-dma-pool", "unmap-on-alloc";
> > 		reusable;
> > 		linux,cma-default;
> > 		...
> > 	}
> > 
> > That "unmap-on-alloc" driver sets the memblock flags and register some cma hooks
> > (to be defined) for cma_alloc/cma_free where it unmaps/re-maps into the linear
> > map.
> > 
> > The nice property is optee won't need to be modified anymore. The downside is
> > the entire pool is now mapped at PTE-level.
> 
> Sounds reasonable to me. If folks are really worried about performance
> with generic CMA PTE-level map then OP-TEE already supports no-map based
> reserved carveouts for protected DMABufs too.
> 
> -Sumit
> 
> > 
> > [1] http://lore.kernel.org/all/20260902172436.GB1440252-robh@kernel.org/
> > 
> > -- 
> > Vincent

I have just looked deeper into and cma_alloc can't unmap automatically the
default pool. Callers expect a valid linear mapping right after the alocation.
dma_direct_alloc() and dma_direct_alloc_pages() zero the allocated page,
dma_direct_alloc_no_mapping() runs cache maintenance on it, and the userspace
available heap /dev/dma_heap/linux,cma zeroes it.

Also, it isn't possible to use two compatible strings for the reserved memory.
The registration stops at the first matching compatible string. Layering drivers
won't work either.

So while the pool can still be generic and serve as linux,cma-default:

  linux,cma {
      compatible = "unmappable-dma-pool";
      reusable;
      linux,cma-default;
  }

We can't escape providing an additional API to unmap/remap in the linear map. 

-- 
Vincent


