Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EC3D5D684
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 18:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tq9K0ow1MrNK75wYNQGcw5MX3kBi8IqSwtMS2q0MPUg=; b=ZMJXw9VTClyfyUSkm6RR+wsmOg
	Lq4x4YRMQpKiO6aNhnB+I5KwvrkxPUdCZGU5UPwMEzKHpaXOKji8B4wqnz0tpKv2RVF3h3q1TaHlc
	qLhFQfpCJFsNAhQ49PNnlkXcEbxCh8N+IDGd9xlahdykoxlu2G6S8Pr9usHjDeQrXPYV7QabWw2z6
	9BwAWV3uyn6pE9ub6y+h6Q4k2B/P9EjIqPRvq2pHek6YEVbb3MBGNipC97F90z9skZqWPhSywIbed
	s+fX8tLLQyv4DAIWXK3IX/3AnM+Ibdd7tE43WyAHGTF1SxS3VRCM/hsolYWy5HZSG3A5NTqRYy1Le
	0OlvJ42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t97dM-00000007yuT-1N9g;
	Thu, 07 Nov 2024 18:53:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t97bc-00000007ykJ-32r4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 18:51:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ACE53A44A0D;
	Thu,  7 Nov 2024 18:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D420BC4CECC;
	Thu,  7 Nov 2024 18:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731005503;
	bh=F7XeE+bTVwZHEDe35rY7oTkCr56f045W1p7MsvwWR2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BSfuakC7hNsJyU2A8aGkoaH3az+z4hXy9SZD5PX8GejNM/ijhHwSMemUcnlDoSu7w
	 UZztW+J0BahGvRKq/mq0iFlwmYmqdNemMqdEzmxiX+eXi63TgT1a9+5IiHTlTZ2XIt
	 azWqFjjHkBcWBPv0aJ/M61WcQcvuTffQY4YGjcX2Iy+CQ4JmxB53a+vB7V0EhkapGX
	 NlEc4ehRsJbitTfCJfjDRGHfYfVPU1n/i/eizs3zm8SztNEPJWC6m5RLocmV4TOVGV
	 jvRhqBsBAkvO/Xr8DSsuVyxB7HUACAPuR6kr2GRTkLo02x4Ic3ypnJDeEZHUDXjlVY
	 +yucEk/Vix1UQ==
Date: Thu, 7 Nov 2024 10:51:41 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Steve Clevenger <scclevenger@os.amperecomputing.com>
Cc: leo.yan@arm.com, james.clark@linaro.org, mike.leach@linaro.org,
	suzuki.poulose@arm.com, ilkka@os.amperecomputing.com,
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V10 RESEND 1/2] perf util scripting-engines cs-etm: Add
 map_pgoff to python dictionary
Message-ID: <Zy0MPdvV5ofHtyE3@google.com>
References: <cover.1728599785.git.scclevenger@os.amperecomputing.com>
 <20241106235110.5NbhrBJjBk6qY_Sg0BJUbMXfpfpi8KZK5R-y4rZfKXI@z>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106235110.5NbhrBJjBk6qY_Sg0BJUbMXfpfpi8KZK5R-y4rZfKXI@z>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_105144_913380_7E7DBFE8 
X-CRM114-Status: GOOD (  15.95  )
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

On Wed, Nov 06, 2024 at 04:51:10PM -0700, Steve Clevenger wrote:
> Add map_pgoff parameter to python dictionary so it can be seen by the
> python script.
> 
> Signed-off-by: Steve Clevenger <scclevenger@os.amperecomputing.com>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/perf/util/scripting-engines/trace-event-python.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/util/scripting-engines/trace-event-python.c b/tools/perf/util/scripting-engines/trace-event-python.c
> index d7183134b669..367132b3a51a 100644
> --- a/tools/perf/util/scripting-engines/trace-event-python.c
> +++ b/tools/perf/util/scripting-engines/trace-event-python.c
> @@ -793,7 +793,8 @@ static int set_regs_in_dict(PyObject *dict,
>  static void set_sym_in_dict(PyObject *dict, struct addr_location *al,
>  			    const char *dso_field, const char *dso_bid_field,
>  			    const char *dso_map_start, const char *dso_map_end,
> -			    const char *sym_field, const char *symoff_field)
> +			    const char *sym_field, const char *symoff_field,
> +			    const char *map_pgoff)
>  {
>  	char sbuild_id[SBUILD_ID_SIZE];
>  
> @@ -809,6 +810,8 @@ static void set_sym_in_dict(PyObject *dict, struct addr_location *al,
>  			PyLong_FromUnsignedLong(map__start(al->map)));
>  		pydict_set_item_string_decref(dict, dso_map_end,
>  			PyLong_FromUnsignedLong(map__end(al->map)));
> +		pydict_set_item_string_decref(dict, map_pgoff,
> +			PyLong_FromUnsignedLongLong(al->map->pgoff));

Please use map__pgoff(al->map) instead.  Otherwise you'll get this in
the debug build:

  util/scripting-engines/trace-event-python.c: In function 'set_sym_in_dict':     
  util/scripting-engines/trace-event-python.c:814:60: error: 'struct map' has no member named 'pgoff'
    814 |                         PyLong_FromUnsignedLongLong(al->map->pgoff));   
        |                                                            ^~

Thanks,
Namhyung


>  	}
>  	if (al->sym) {
>  		pydict_set_item_string_decref(dict, sym_field,
> @@ -895,7 +898,7 @@ static PyObject *get_perf_sample_dict(struct perf_sample *sample,
>  	pydict_set_item_string_decref(dict, "comm",
>  			_PyUnicode_FromString(thread__comm_str(al->thread)));
>  	set_sym_in_dict(dict, al, "dso", "dso_bid", "dso_map_start", "dso_map_end",
> -			"symbol", "symoff");
> +			"symbol", "symoff", "map_pgoff");
>  
>  	pydict_set_item_string_decref(dict, "callchain", callchain);
>  
> @@ -920,7 +923,7 @@ static PyObject *get_perf_sample_dict(struct perf_sample *sample,
>  			PyBool_FromLong(1));
>  		set_sym_in_dict(dict_sample, addr_al, "addr_dso", "addr_dso_bid",
>  				"addr_dso_map_start", "addr_dso_map_end",
> -				"addr_symbol", "addr_symoff");
> +				"addr_symbol", "addr_symoff", "addr_map_pgoff");
>  	}
>  
>  	if (sample->flags)
> -- 
> 2.44.0
> 

