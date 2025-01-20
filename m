Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3D4C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 12:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtGgZwZcx9qsF1HP708xbPM/P0Ti6hiRzcxuNGQlTWs=; b=Q9Kjt+T2Vvo/csA6Ku6s9NURD0
	zNz7LGZaREGNb96+TpWL9dkf0YUAWgByPwas1w2Z5kZvnkU4Sw91oGjkAVRWfQemJkXQsy+LPpvXk
	y8hBW0doL6n8g9XBoyVjbkfESR90UeCLBP6P5DnkRereO9t7aLMBJI8QPRE9GoPirMQ8LMThS/aC0
	mJBbpIG2XFGuqU/9CYelWUsq7uv96YxMCpc9xh4DLX4XsvHkmgbY4kvEPV+bG9uj9YXIPykrLmoYO
	gluP93O/VmM1nn8YXApBxEWUxLSV5cNizSK7CXbSML6R6hO7W0Tz+yQL5aGfaUwxXVMBJoe/3HgIZ
	Us+zNUeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrDv-00000005ZpH-1joI;
	Mon, 20 Jan 2025 12:49:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrCe-00000005ZkG-0OUs;
	Mon, 20 Jan 2025 12:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737377306;
	bh=684y5TgtzaetJ5FHig4I7kEvShgmSEw5UyHsxZrm6GY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h/68vzQ2kj1u6XJAWkwkJjoqjQB58BPRUlrbonE05/VzN/Eo5n1vhdj/RtMz0TIH8
	 VUhjxqqcTceRVmPERQ4BJ/jg992486b+2t8ehoVfdPp4hRntL5nLXA6yT7mXDK2i/Y
	 Sjq4Q8Ob+dLN7gMEi3MOhgOLGo+//R2vCt4mzdMZ54PEjGjK2gmVMzKUDwOKmhDU55
	 ycwxXreJT2ItP0CTC4wNZ+WjRLFKmekQ1eDeHenvzT4dY0pxJ0M5GP4b9A5gkU1Ufc
	 Z9wxd4whMjgbzejawA4TZnpKYTN+8rUshssT8opsOg6yHGLUWHH5deZAdDlLEERrEP
	 ScECJUAm/5sbw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B192117E0F66;
	Mon, 20 Jan 2025 13:48:24 +0100 (CET)
Message-ID: <0dddf0b6-e87f-4d70-be64-b6705b33466d@collabora.com>
Date: Mon, 20 Jan 2025 13:48:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 32/34] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
To: kernel test robot <lkp@intel.com>, chunkuang.hu@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
References: <20250113145232.227674-33-angelogioacchino.delregno@collabora.com>
 <202501180524.qKnNpITh-lkp@intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <202501180524.qKnNpITh-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_044828_288425_2EE98FF7 
X-CRM114-Status: GOOD (  20.10  )
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

Il 17/01/25 23:04, kernel test robot ha scritto:
> Hi AngeloGioacchino,
> 
> kernel test robot noticed the following build warnings:
> 

CK, if there's no other concern about this submission, and you deem it ready to
be applied - can you please resolve this error while applying by adding

`#include <linux/bitfield.h>`  before  `#include <linux/clk.h>`

without me resending a 34 patches bomb for a one-line change?

Many thanks,
Angelo

> [auto build test WARNING on next-20250113]
> [cannot apply to robh/for-next pza/reset/next linus/master pza/imx-drm/next drm-misc/drm-misc-next v6.13-rc7 v6.13-rc6 v6.13-rc5 v6.13-rc7]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-dpi-Add-MT8195-and-MT8188-compat/20250113-225554
> base:   next-20250113
> patch link:    https://lore.kernel.org/r/20250113145232.227674-33-angelogioacchino.delregno%40collabora.com
> patch subject: [PATCH v5 32/34] drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
> config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250118/202501180524.qKnNpITh-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180524.qKnNpITh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501180524.qKnNpITh-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c: In function 'mtk_ddc_check_and_rise_low_bus':
>     drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:59:36: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
>        59 |                                    FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_CLOCK_SCL));
>           |                                    ^~~~~~~~~~
>     In file included from ./arch/openrisc/include/generated/asm/div64.h:1,
>                      from include/linux/math.h:6,
>                      from include/linux/kernel.h:27,
>                      from include/linux/clk.h:13,
>                      from drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:11:
>     drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c: In function 'mtk_ddcm_read_hdmi':
>>> include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
>       183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
>           |                                   ^~
>     drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:139:23: note: in expansion of macro 'do_div'
>       139 |                 rem = do_div(loop_counter, temp_length);
>           |                       ^~~~~~
>     In file included from include/linux/err.h:5,
>                      from include/linux/clk.h:12:
>>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
>       195 |         } else if (likely(((n) >> 32) == 0)) {          \
>           |                                ^~
>     include/linux/compiler.h:76:45: note: in definition of macro 'likely'
>        76 | # define likely(x)      __builtin_expect(!!(x), 1)
>           |                                             ^
>     drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:139:23: note: in expansion of macro 'do_div'
>       139 |                 rem = do_div(loop_counter, temp_length);
>           |                       ^~~~~~
>     include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
>       199 |                 __rem = __div64_32(&(n), __base);       \
>           |                                    ^~~~
>           |                                    |
>           |                                    u16 * {aka short unsigned int *}
>     drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:139:23: note: in expansion of macro 'do_div'
>       139 |                 rem = do_div(loop_counter, temp_length);
>           |                       ^~~~~~
>     include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'u16 *' {aka 'short unsigned int *'}
>       174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
>           |                            ~~~~~~~~~~^~~~~~~~
>     drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:207:47: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
>       207 |                         puc_value[read_idx] = FIELD_GET(DDC_DATA_OUT, val);
>           |                                               ^~~~~~~~~
> 
> 
> vim +183 include/asm-generic/div64.h
> 
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  176
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  177  /* The unnecessary pointer compare is there
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  178   * to check for type safety (n must be 64bit)
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  179   */
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  180  # define do_div(n,base) ({				\
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  181  	uint32_t __base = (base);			\
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  182  	uint32_t __rem;					\
> ^1da177e4c3f41 Linus Torvalds     2005-04-16 @183  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
> 911918aa7ef6f8 Nicolas Pitre      2015-11-02  184  	if (__builtin_constant_p(__base) &&		\
> 911918aa7ef6f8 Nicolas Pitre      2015-11-02  185  	    is_power_of_2(__base)) {			\
> 911918aa7ef6f8 Nicolas Pitre      2015-11-02  186  		__rem = (n) & (__base - 1);		\
> 911918aa7ef6f8 Nicolas Pitre      2015-11-02  187  		(n) >>= ilog2(__base);			\
> c747ce4706190e Geert Uytterhoeven 2021-08-11  188  	} else if (__builtin_constant_p(__base) &&	\
> 461a5e51060c93 Nicolas Pitre      2015-10-30  189  		   __base != 0) {			\
> 461a5e51060c93 Nicolas Pitre      2015-10-30  190  		uint32_t __res_lo, __n_lo = (n);	\
> 461a5e51060c93 Nicolas Pitre      2015-10-30  191  		(n) = __div64_const32(n, __base);	\
> 461a5e51060c93 Nicolas Pitre      2015-10-30  192  		/* the remainder can be computed with 32-bit regs */ \
> 461a5e51060c93 Nicolas Pitre      2015-10-30  193  		__res_lo = (n);				\
> 461a5e51060c93 Nicolas Pitre      2015-10-30  194  		__rem = __n_lo - __res_lo * __base;	\
> 911918aa7ef6f8 Nicolas Pitre      2015-11-02 @195  	} else if (likely(((n) >> 32) == 0)) {		\
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  196  		__rem = (uint32_t)(n) % __base;		\
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  197  		(n) = (uint32_t)(n) / __base;		\
> c747ce4706190e Geert Uytterhoeven 2021-08-11  198  	} else {					\
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  199  		__rem = __div64_32(&(n), __base);	\
> c747ce4706190e Geert Uytterhoeven 2021-08-11  200  	}						\
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  201  	__rem;						\
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  202   })
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  203
> 


