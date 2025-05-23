Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E38FC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 13:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hm6rQhzjPasnBBzJNL5emUr6ZwW87Bppct+tUI9nqKU=; b=O5uOcc0xb45Tb2IcUsXr+iV3cH
	vC+cI/pwa10VU3qucWmj6ihGCCKnfxYeyJWO3kDbV+7vSrLF7MAQ4D8RSxvlFqEfvZnXzkk1dHtU1
	MDnYWw72qmHlKxPi07ngEiSVqN3ZJW3tnZIKlt+MC7NPoAliLWb8YEx8Jcb8N2UP78LL5owiHfjfx
	sWjGkMqUb0zb6TjpUH30aCJCcjMYbBNfheEkrB8xkOncDufG2TQ7Gj/9u02KWhSDAnPsBsmA6/hcU
	IsFa66Q8tmEVyg3treZPL2voWeK5lDWWJP4/OUjgBXKtctixDKmDkW1fPA18Bt2hWTVZkZcDmPl6g
	9ezCpgXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISgC-00000003zpz-0rZD;
	Fri, 23 May 2025 13:43:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISUx-00000003xm9-1PWg
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 13:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hm6rQhzjPasnBBzJNL5emUr6ZwW87Bppct+tUI9nqKU=; b=cGsaLhoIA3h0sppm9k+Ta1WOs/
	+XLPyHzbbgPof5VxLXtZf/NyYMRwqDDGKMLJg9GiOXeC9Tz4D81W6rHvMv5XvvhRrkOCHymDVrQgo
	9636T433zBLoDcK/CPJdSlLl5S24H3N2ZkzGQCXUCAbD4VUuAUtZfUjnPwX/23nyKsq6uvg/CbRwG
	Q1xQnOsCz+ilbM4M3lJ+J1iNAB2lrHFzo9aLGHJO9/JQAIlbNZ//tfzl46LFE14y3vorwgMbornes
	gR8qc1LkXwdGcnXdY+BHr7D6QNa8AMXaLCD3RzR1oWBOkQfDFa6nccaKAZ864YnG9uqeq+anRSxXh
	fOsm1FvQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uISUt-00000001KX4-2BQ4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:31:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D089B4A698;
	Fri, 23 May 2025 13:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0896C4CEF0;
	Fri, 23 May 2025 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748007095;
	bh=faO7xv/FpWJV7MKksY+5JznU0/E9sVeaKOsouSG4ffI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q4sG/xzz2A8O6AfkTf/d7ll8vClkS5LeIlQIh3Vje5vT0x/w/gPJdVRuUrJQBwPbl
	 ML0curKBoAEfAJ7PNAEklMDyBSbzAZF5kdlLNSkM8hf+8jJfe76DDHNrJSSEzpGn6p
	 fmpuPu0me2pyBkU87b24t7a9H2qD8FINTFlwfK5xvqmdITZ0B/xzkn7FSAMMrnBPPZ
	 mUzzXHsx5aAu4b4cNA7R+b0M/BD8ksH39nZm7EsYvtcZKR+8462Ln9h/SyEm4t0PD7
	 37YkZVbW6g9HtQRF26Iq4HqOKXdGGPyjtej7fruYHi3MzLIwYGyRsITN1VDHnrxcvx
	 AW4a4DO4qe+jQ==
Date: Fri, 23 May 2025 19:01:15 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	Etienne Carriere <etienne.carriere@foss.st.com>
Subject: Re: [PATCH v9 5/9] tee: new ioctl to a register tee_shm from a
 dmabuf file descriptor
Message-ID: <aDB4oxesn5iIM4l8@sumit-X1>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-6-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520152436.474778-6-jens.wiklander@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_143139_946535_4FFD9812 
X-CRM114-Status: GOOD (  48.24  )
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

On Tue, May 20, 2025 at 05:16:48PM +0200, Jens Wiklander wrote:
> From: Etienne Carriere <etienne.carriere@foss.st.com>
> 
> Add a userspace API to create a tee_shm object that refers to a dmabuf
> reference.
> 
> Userspace registers the dmabuf file descriptor as in a tee_shm object.
> The registration is completed with a tee_shm returned file descriptor.
> 
> Userspace is free to close the dmabuf file descriptor after it has been
> registered since all the resources are now held via the new tee_shm
> object.
> 
> Closing the tee_shm file descriptor will eventually release all
> resources used by the tee_shm object when all references are released.
> 
> The new IOCTL, TEE_IOC_SHM_REGISTER_FD, supports dmabuf references to
> physically contiguous memory buffers. Dmabuf references acquired from
> the TEE DMA-heap can be used as protected memory for Secure Video Path
> and such use cases. It depends on the TEE and the TEE driver if dmabuf
> references acquired by other means can be used.
> 
> A new tee_shm flag is added to identify tee_shm objects built from a
> registered dmabuf, TEE_SHM_DMA_BUF.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/tee_core.c    |  63 +++++++++++++++++++++-
>  drivers/tee/tee_private.h |  10 ++++
>  drivers/tee/tee_shm.c     | 111 ++++++++++++++++++++++++++++++++++++--
>  include/linux/tee_core.h  |   1 +
>  include/linux/tee_drv.h   |  10 ++++
>  include/uapi/linux/tee.h  |  31 +++++++++++
>  6 files changed, 221 insertions(+), 5 deletions(-)

With below minor comments fixed, feel free to add:

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

> 
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 5259b8223c27..0e9d9e5872a4 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -353,11 +353,49 @@ tee_ioctl_shm_register(struct tee_context *ctx,
>  	return ret;
>  }
>  
> +static int
> +tee_ioctl_shm_register_fd(struct tee_context *ctx,
> +			  struct tee_ioctl_shm_register_fd_data __user *udata)
> +{
> +	struct tee_ioctl_shm_register_fd_data data;
> +	struct tee_shm *shm;
> +	long ret;
> +
> +	if (copy_from_user(&data, udata, sizeof(data)))
> +		return -EFAULT;
> +
> +	/* Currently no input flags are supported */
> +	if (data.flags)
> +		return -EINVAL;
> +
> +	shm = tee_shm_register_fd(ctx, data.fd);
> +	if (IS_ERR(shm))
> +		return -EINVAL;
> +
> +	data.id = shm->id;
> +	data.flags = shm->flags;
> +	data.size = shm->size;
> +
> +	if (copy_to_user(udata, &data, sizeof(data)))
> +		ret = -EFAULT;
> +	else
> +		ret = tee_shm_get_fd(shm);
> +
> +	/*
> +	 * When user space closes the file descriptor the shared memory
> +	 * should be freed or if tee_shm_get_fd() failed then it will
> +	 * be freed immediately.
> +	 */
> +	tee_shm_put(shm);
> +	return ret;
> +}
> +
>  static int param_from_user_memref(struct tee_context *ctx,
>  				  struct tee_param_memref *memref,
>  				  struct tee_ioctl_param *ip)
>  {
>  	struct tee_shm *shm;
> +	size_t offs = 0;
>  
>  	/*
>  	 * If a NULL pointer is passed to a TA in the TEE,
> @@ -388,6 +426,26 @@ static int param_from_user_memref(struct tee_context *ctx,
>  			tee_shm_put(shm);
>  			return -EINVAL;
>  		}
> +
> +		if (shm->flags & TEE_SHM_DMA_BUF) {
> +			struct tee_shm_dmabuf_ref *ref;
> +
> +			ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
> +			if (ref->parent_shm) {
> +				/*
> +				 * The shm already has one reference to
> +				 * ref->parent_shm so we are clear of 0.
> +				 * We're getting another reference since
> +				 * this shm will be used in the parameter
> +				 * list instead of the shm we got with
> +				 * tee_shm_get_from_id() above.
> +				 */
> +				refcount_inc(&ref->parent_shm->refcount);
> +				tee_shm_put(shm);
> +				shm = ref->parent_shm;
> +				offs = ref->offset;
> +			}
> +		}
>  	} else if (ctx->cap_memref_null) {
>  		/* Pass NULL pointer to OP-TEE */
>  		shm = NULL;
> @@ -395,7 +453,7 @@ static int param_from_user_memref(struct tee_context *ctx,
>  		return -EINVAL;
>  	}
>  
> -	memref->shm_offs = ip->a;
> +	memref->shm_offs = ip->a + offs;

Is this an issue being detected now? If yes then shouldn't it be a
separate fix eligible for backport?

>  	memref->size = ip->b;
>  	memref->shm = shm;
>  
> @@ -841,6 +899,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return tee_ioctl_shm_alloc(ctx, uarg);
>  	case TEE_IOC_SHM_REGISTER:
>  		return tee_ioctl_shm_register(ctx, uarg);
> +	case TEE_IOC_SHM_REGISTER_FD:
> +		return tee_ioctl_shm_register_fd(ctx, uarg);
>  	case TEE_IOC_OPEN_SESSION:
>  		return tee_ioctl_open_session(ctx, uarg);
>  	case TEE_IOC_INVOKE:
> @@ -1300,3 +1360,4 @@ MODULE_AUTHOR("Linaro");
>  MODULE_DESCRIPTION("TEE Driver");
>  MODULE_VERSION("1.0");
>  MODULE_LICENSE("GPL v2");
> +MODULE_IMPORT_NS("DMA_BUF");
> diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
> index 6c6ff5d5eed2..308467705da6 100644
> --- a/drivers/tee/tee_private.h
> +++ b/drivers/tee/tee_private.h
> @@ -13,6 +13,16 @@
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  
> +/* extra references appended to shm object for registered shared memory */
> +struct tee_shm_dmabuf_ref {
> +	struct tee_shm shm;
> +	size_t offset;
> +	struct dma_buf *dmabuf;
> +	struct dma_buf_attachment *attach;
> +	struct sg_table *sgt;
> +	struct tee_shm *parent_shm;
> +};
> +
>  int tee_shm_get_fd(struct tee_shm *shm);
>  
>  bool tee_device_get(struct tee_device *teedev);
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index daf6e5cfd59a..e1ed52ee0a16 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -4,6 +4,7 @@
>   */
>  #include <linux/anon_inodes.h>
>  #include <linux/device.h>
> +#include <linux/dma-buf.h>
>  #include <linux/idr.h>
>  #include <linux/io.h>
>  #include <linux/mm.h>
> @@ -45,7 +46,23 @@ static void release_registered_pages(struct tee_shm *shm)
>  
>  static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
>  {
> -	if (shm->flags & TEE_SHM_POOL) {
> +	struct tee_shm *parent_shm = NULL;
> +	void *p = shm;
> +
> +	if (shm->flags & TEE_SHM_DMA_BUF) {
> +		struct tee_shm_dmabuf_ref *ref;
> +
> +		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
> +		parent_shm = ref->parent_shm;
> +		p = ref;
> +		if (ref->attach) {
> +			dma_buf_unmap_attachment(ref->attach, ref->sgt,
> +						 DMA_BIDIRECTIONAL);
> +
> +			dma_buf_detach(ref->dmabuf, ref->attach);
> +		}
> +		dma_buf_put(ref->dmabuf);
> +	} else if (shm->flags & TEE_SHM_POOL) {
>  		teedev->pool->ops->free(teedev->pool, shm);
>  	} else if (shm->flags & TEE_SHM_DYNAMIC) {
>  		int rc = teedev->desc->ops->shm_unregister(shm->ctx, shm);
> @@ -57,9 +74,10 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
>  		release_registered_pages(shm);
>  	}
>  
> -	teedev_ctx_put(shm->ctx);
> +	if (shm->ctx)
> +		teedev_ctx_put(shm->ctx);

redundant change?

>  
> -	kfree(shm);
> +	kfree(p);
>  
>  	tee_device_put(teedev);
>  }
> @@ -169,7 +187,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size)
>   * tee_client_invoke_func(). The memory allocated is later freed with a
>   * call to tee_shm_free().
>   *
> - * @returns a pointer to 'struct tee_shm'
> + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on failure
>   */
>  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size)
>  {
> @@ -179,6 +197,91 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size)
>  }
>  EXPORT_SYMBOL_GPL(tee_shm_alloc_kernel_buf);
>  
> +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
> +{
> +	struct tee_shm_dmabuf_ref *ref;
> +	int rc;
> +
> +	if (!tee_device_get(ctx->teedev))
> +		return ERR_PTR(-EINVAL);
> +
> +	teedev_ctx_get(ctx);
> +
> +	ref = kzalloc(sizeof(*ref), GFP_KERNEL);
> +	if (!ref) {
> +		rc = -ENOMEM;
> +		goto err_put_tee;
> +	}
> +
> +	refcount_set(&ref->shm.refcount, 1);
> +	ref->shm.ctx = ctx;
> +	ref->shm.id = -1;
> +	ref->shm.flags = TEE_SHM_DMA_BUF;
> +
> +	ref->dmabuf = dma_buf_get(fd);
> +	if (IS_ERR(ref->dmabuf)) {
> +		rc = PTR_ERR(ref->dmabuf);
> +		goto err_kfree_ref;
> +	}
> +
> +	rc = tee_heap_update_from_dma_buf(ctx->teedev, ref->dmabuf,
> +					  &ref->offset, &ref->shm,
> +					  &ref->parent_shm);
> +	if (!rc)
> +		goto out;
> +	if (rc != -EINVAL)
> +		goto err_put_dmabuf;
> +
> +	ref->attach = dma_buf_attach(ref->dmabuf, &ctx->teedev->dev);
> +	if (IS_ERR(ref->attach)) {
> +		rc = PTR_ERR(ref->attach);
> +		goto err_put_dmabuf;
> +	}
> +
> +	ref->sgt = dma_buf_map_attachment(ref->attach, DMA_BIDIRECTIONAL);
> +	if (IS_ERR(ref->sgt)) {
> +		rc = PTR_ERR(ref->sgt);
> +		goto err_detach;
> +	}
> +
> +	if (sg_nents(ref->sgt->sgl) != 1) {
> +		rc = -EINVAL;
> +		goto err_unmap_attachement;
> +	}
> +
> +	ref->shm.paddr = page_to_phys(sg_page(ref->sgt->sgl));
> +	ref->shm.size = ref->sgt->sgl->length;
> +
> +out:
> +	mutex_lock(&ref->shm.ctx->teedev->mutex);
> +	ref->shm.id = idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
> +				1, 0, GFP_KERNEL);
> +	mutex_unlock(&ref->shm.ctx->teedev->mutex);
> +	if (ref->shm.id < 0) {
> +		rc = ref->shm.id;
> +		if (ref->attach)
> +			goto err_unmap_attachement;
> +		goto err_put_dmabuf;
> +	}
> +
> +	return &ref->shm;
> +
> +err_unmap_attachement:
> +	dma_buf_unmap_attachment(ref->attach, ref->sgt, DMA_BIDIRECTIONAL);
> +err_detach:
> +	dma_buf_detach(ref->dmabuf, ref->attach);
> +err_put_dmabuf:
> +	dma_buf_put(ref->dmabuf);
> +err_kfree_ref:
> +	kfree(ref);
> +err_put_tee:
> +	teedev_ctx_put(ctx);
> +	tee_device_put(ctx->teedev);
> +
> +	return ERR_PTR(rc);
> +}
> +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> +
>  /**
>   * tee_shm_alloc_priv_buf() - Allocate shared memory for a privately shared
>   *			      kernel buffer
> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> index b8b99c97e00c..02c07f661349 100644
> --- a/include/linux/tee_core.h
> +++ b/include/linux/tee_core.h
> @@ -28,6 +28,7 @@
>  #define TEE_SHM_USER_MAPPED	BIT(1)  /* Memory mapped in user space */
>  #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
>  #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
> +#define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
>  
>  #define TEE_DEVICE_FLAG_REGISTERED	0x1
>  #define TEE_MAX_DEV_NAME_LEN		32
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index a54c203000ed..824f1251de60 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -116,6 +116,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size);
>  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
>  					    void *addr, size_t length);
>  
> +/**
> + * tee_shm_register_fd() - Register shared memory from file descriptor
> + *
> + * @ctx:	Context that allocates the shared memory
> + * @fd:		Shared memory file descriptor reference
> + *
> + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on failure
> + */
> +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd);
> +
>  /**
>   * tee_shm_free() - Free shared memory
>   * @shm:	Handle to shared memory to free
> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> index d0430bee8292..8ec5f46fbfbe 100644
> --- a/include/uapi/linux/tee.h
> +++ b/include/uapi/linux/tee.h
> @@ -118,6 +118,37 @@ struct tee_ioctl_shm_alloc_data {
>  #define TEE_IOC_SHM_ALLOC	_IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1, \
>  				     struct tee_ioctl_shm_alloc_data)
>  
> +/**
> + * struct tee_ioctl_shm_register_fd_data - Shared memory registering argument
> + * @fd:		[in] File descriptor identifying dmabuf reference
> + * @size:	[out] Size of referenced memory
> + * @flags:	[in] Flags to/from allocation.
> + * @id:		[out] Identifier of the shared memory
> + *
> + * The flags field should currently be zero as input. Updated by the call
> + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD below.
> + */
> +struct tee_ioctl_shm_register_fd_data {
> +	__s64 fd;
> +	__u64 size;
> +	__u32 flags;
> +	__s32 id;
> +};
> +
> +/**
> + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file descriptor
> + *
> + * Returns a file descriptor on success or < 0 on failure
> + *
> + * The returned file descriptor refers to the shared memory object in the
> + * kernel. The supplied file deccriptor can be closed if it's not needed
> + * for other purposes. The shared memory is freed when the descriptor is
> + * closed.
> + */
> +#define TEE_IOC_SHM_REGISTER_FD	_IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 8, \
> +				     struct tee_ioctl_shm_register_fd_data)

Please add this IOCTL in correct sequence order.

-Sumit

> +
>  /**
>   * struct tee_ioctl_buf_data - Variable sized buffer
>   * @buf_ptr:	[in] A __user pointer to a buffer
> -- 
> 2.43.0
> 

