Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9619CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 18:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VU+sD5LsGgKlT7WK1t2kvTaURoqtS+jV65CI0LAKuTw=; b=ryl+3hgnGTiqwrYOEmDnNNaLQs
	srnPo8In3jMpI18JfqriYt05oCH83J53GhHDcEvhZMT8GF913SDshX7O2Y2NPsGBENEy/ZHniPzHK
	RyvyyQ1DwHBsPzW1TTJeEy+uniXWIB3CPC1v3rGNTLyrh6eTA1PPTUPuEcGZYXDGw2/2Loc6l2QCy
	O+ebXqWgaCxsBaja6/JkkU2mJUWk/ePIW16SnXQ6Se3f0HyTeEvoaGos1LlMoK9rciwaqvzSUFX7+
	xdIxJA0/AEuZjiUc5Trv0sDok5mXHQpVhuvpK5wh2k5pQ7uE/E+f1pVtKLUFfbaufKcWrIfz6+iFp
	AkwPQavw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPXG-00000007Dkw-3yEQ;
	Fri, 08 May 2026 18:02:50 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPXF-00000007DjV-4Axq;
	Fri, 08 May 2026 18:02:50 +0000
Message-ID: <652a2af6-739d-4cd1-a72f-9505c3720fc7@infradead.org>
Date: Fri, 8 May 2026 11:02:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] soc: ti: knav_qmss: Fix kernel-doc Return: tags
To: Nishanth Menon <nm@ti.com>, Justin Stitt <justinstitt@google.com>,
 Bill Wendling <morbo@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260508153211.3688277-1-nm@ti.com>
 <20260508153211.3688277-5-nm@ti.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260508153211.3688277-5-nm@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 5/8/26 8:32 AM, Nishanth Menon wrote:
> Fix functions that use inline 'Returns ...' instead of 'Return:'
> kernel-doc comments, producing warnings with W=2:
> 
>   knav_qmss_queue.c:524: No description found for return value
>   of 'knav_queue_open'
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> Cc: Randy Dunlap <rdunlap@infradead.org>
> 
>  drivers/soc/ti/knav_qmss_queue.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
> index f65658014b05..c3f85052002b 100644
> --- a/drivers/soc/ti/knav_qmss_queue.c
> +++ b/drivers/soc/ti/knav_qmss_queue.c
> @@ -517,7 +517,7 @@ static int knav_queue_flush(struct knav_queue *qh)
>   *			     Subsequent attempts to open a shared queue should
>   *			     also have this flag.
>   *
> - * Returns a handle to the open hardware queue if successful. Use IS_ERR()
> + * Return: handle to the open hardware queue on success. Use IS_ERR()
>   * to check the returned value for error codes.
>   */
>  void *knav_queue_open(const char *name, unsigned id,
> @@ -573,7 +573,7 @@ EXPORT_SYMBOL_GPL(knav_queue_close);
>   * @cmd:			- control commands
>   * @arg:			- command argument
>   *
> - * Returns 0 on success, errno otherwise.
> + * Return: 0 on success, errno otherwise.
>   */
>  int knav_queue_device_control(void *qhandle, enum knav_queue_ctrl_cmd cmd,
>  				unsigned long arg)
> @@ -625,7 +625,7 @@ EXPORT_SYMBOL_GPL(knav_queue_device_control);
>   * @size:		- size of data to push
>   * @flags:		- can be used to pass additional information
>   *
> - * Returns 0 on success, errno otherwise.
> + * Return: 0 on success, errno otherwise.
>   */
>  int knav_queue_push(void *qhandle, dma_addr_t dma,
>  					unsigned size, unsigned flags)
> @@ -646,7 +646,7 @@ EXPORT_SYMBOL_GPL(knav_queue_push);
>   * @qhandle:		- hardware queue handle
>   * @size:		- (optional) size of the data pop'ed.
>   *
> - * Returns a DMA address on success, 0 on failure.
> + * Return: DMA address on success, 0 on failure.
>   */
>  dma_addr_t knav_queue_pop(void *qhandle, unsigned *size)
>  {
> @@ -747,8 +747,8 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_dma_to_virt);
>   * @region_id:		- QMSS region id from which the descriptors are to be
>   *			  allocated.
>   *
> - * Returns a pool handle on success.
> - * Use IS_ERR_OR_NULL() to identify error values on return.
> + * Return: pool handle on success. Use IS_ERR_OR_NULL() to identify
> + * error values on return.
>   */
>  void *knav_pool_create(const char *name,
>  					int num_desc, int region_id)
> @@ -878,7 +878,7 @@ EXPORT_SYMBOL_GPL(knav_pool_destroy);
>   * knav_pool_desc_get()	- Get a descriptor from the pool
>   * @ph:		- pool handle
>   *
> - * Returns descriptor from the pool.
> + * Return: descriptor from the pool on success, error pointer otherwise.
>   */
>  void *knav_pool_desc_get(void *ph)
>  {
> @@ -917,7 +917,7 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_put);
>   * @dma:			- DMA address return pointer
>   * @dma_sz:			- adjusted return pointer
>   *
> - * Returns 0 on success, errno otherwise.
> + * Return: 0 on success, errno otherwise.
>   */
>  int knav_pool_desc_map(void *ph, void *desc, unsigned size,
>  					dma_addr_t *dma, unsigned *dma_sz)
> @@ -942,7 +942,7 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_map);
>   * @dma:			- DMA address of descriptor to unmap
>   * @dma_sz:			- size of descriptor to unmap
>   *
> - * Returns descriptor address on success, Use IS_ERR_OR_NULL() to identify
> + * Return: descriptor address on success. Use IS_ERR_OR_NULL() to identify
>   * error values on return.
>   */
>  void *knav_pool_desc_unmap(void *ph, dma_addr_t dma, unsigned dma_sz)
> @@ -962,7 +962,8 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_unmap);
>  /**
>   * knav_pool_count()	- Get the number of descriptors in pool.
>   * @ph:			- pool handle
> - * Returns number of elements in the pool.
> + *
> + * Return: number of elements in the pool.
>   */
>  int knav_pool_count(void *ph)
>  {

-- 
~Randy

