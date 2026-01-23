Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B6BD7237B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 11:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+VNQIibetsKXOEk2W6mNAkqaSCSDlfn7bngHe4/Oe0=; b=oapy317xq3rrgsLKG++0NuDzcC
	7JB+FiEOGpz3b2C69GPMEEPUBGCWlolpkv1TFtI33rhFYUDIGeKpZS3Vz/kXmd5ZCkwj7Fjf57+bA
	dI93avQGWEiF7CwrpxjWs2/0QCmOrKjdJcOOQ9NVSAgJwCzo1oWoFRYvCiB2mnM0ku9VpC1/UyaAq
	3guQdwpLysJPSy+RF3wKtjwG4Q6vVAcj5jbZDf32B+EccGWicou8W1VZmdpGwBK39ve2xRyHth9M7
	S62Ac9XjmlEBjvHfAur8ZOk/PyUBQmvHz9N3N0JKBiFiy5eYan2BiJO1ikt/JPiOv/ruCtGdQK5x9
	57VMkAow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFa7-00000008rvr-1p5f;
	Fri, 23 Jan 2026 11:44:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFa4-00000008rv1-3LYp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 11:44:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C041C1476;
	Fri, 23 Jan 2026 03:43:52 -0800 (PST)
Received: from [10.57.52.8] (unknown [10.57.52.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2637C3F632;
	Fri, 23 Jan 2026 03:43:54 -0800 (PST)
Message-ID: <3c6bddfd-a674-486c-add4-35ef93ec88c4@arm.com>
Date: Fri, 23 Jan 2026 11:43:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/17] firmware: arm_scmi: Use new Telemetry traces
To: Cristian Marussi <cristian.marussi@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: sudeep.holla@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com,
 vincent.guittot@linaro.org, etienne.carriere@st.com, peng.fan@oss.nxp.com,
 michal.simek@amd.com, dan.carpenter@linaro.org, d-gole@ti.com,
 jonathan.cameron@huawei.com, lukasz.luba@arm.com, philip.radford@arm.com,
 souvik.chakravarty@arm.com, elif.topuz@arm.com
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
 <20260114114638.2290765-8-cristian.marussi@arm.com>
Content-Language: en-US
From: Elif Topuz <elif.topuz@arm.com>
In-Reply-To: <20260114114638.2290765-8-cristian.marussi@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_034400_922945_DF13DA9C 
X-CRM114-Status: GOOD (  19.84  )
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


Hi Cristian,

On 14/01/2026 11:46, Cristian Marussi wrote:
> Track failed SHMTI accesses and received notifications.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 57 ++++++++++++++++++++++-----
>  1 file changed, 48 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index 16bcdcdc1dc3..443e032a3553 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -25,6 +25,8 @@
>  #include "protocols.h"
>  #include "notify.h"
>  
> +#include <trace/events/scmi.h>
> +
>  /* Updated only after ALL the mandatory features for that version are merged */
>  #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
>  
> @@ -1366,8 +1368,10 @@ static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
>  
>  	/* Check for spec compliance */
>  	if (USE_LINE_TS(payld) || USE_BLK_TS(payld) ||
> -	    DATA_INVALID(payld) || (PAYLD_ID(payld) != 0))
> +	    DATA_INVALID(payld) || (PAYLD_ID(payld) != 0)) {
> +		trace_scmi_tlm_access(0, "BLK_TS_INVALID", 0, 0);
>  		return;
> +	}
>  
>  	/* A BLK_TS descriptor MUST be returned: it is found or it is crated */
>  	bts = scmi_telemetry_blkts_lookup(ti->ph->dev, &ti->xa_bts, payld);
> @@ -1376,6 +1380,9 @@ static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
>  
>  	/* Update the descriptor with the lastest TS*/
>  	scmi_telemetry_blkts_update(shmti->last_magic, bts);
> +
> +	trace_scmi_tlm_collect(bts->last_ts, (u64)payld,
> +			       bts->last_magic, "SHMTI_BLK_TS");
>  }
>  
>  static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
> @@ -1393,8 +1400,10 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
>  	/* Is thi DE ID know ? */
>  	tde = scmi_telemetry_tde_lookup(ti, de_id);
>  	if (!tde) {
> -		if (mode != SCAN_DISCOVERY)
> +		if (mode != SCAN_DISCOVERY) {
> +			trace_scmi_tlm_access(de_id, "DE_INVALID", 0, 0);
>  			return;
> +		}
>  
>  		/* In SCAN_DISCOVERY mode we allocate new DEs for unknown IDs */
>  		tde = scmi_telemetry_tde_get(ti, de_id);
> @@ -1462,6 +1471,8 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
>  		tde->last_ts = tstamp;
>  	else
>  		tde->last_ts = 0;
> +
> +	trace_scmi_tlm_collect(0, tde->de.info->id, tde->last_val, "SHMTI_DE_UPDT");

tde->last_ts instead of 0?

>  }
>  
>  static int scmi_telemetry_tdcf_line_parse(struct telemetry_info *ti,
> @@ -1507,8 +1518,10 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
>  		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * 1000);
>  
>  		startm = TDCF_START_SEQ_GET(tdcf);
> -		if (IS_BAD_START_SEQ(startm))
> +		if (IS_BAD_START_SEQ(startm)) {
> +			trace_scmi_tlm_access(0, "MSEQ_BADSTART", startm, 0);
>  			continue;
> +		}
>  
>  		/* On a BAD_SEQ this will be updated on the next attempt */
>  		shmti->last_magic = startm;
> @@ -1520,18 +1533,25 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
>  
>  			used_qwords = scmi_telemetry_tdcf_line_parse(ti, next,
>  								     shmti, mode);
> -			if (qwords < used_qwords)
> +			if (qwords < used_qwords) {
> +				trace_scmi_tlm_access(PAYLD_ID(next),
> +						      "BAD_QWORDS", startm, 0);
>  				return -EINVAL;
> +			}
>  
>  			next += used_qwords * 8;
>  			qwords -= used_qwords;
>  		}
>  
>  		endm = TDCF_END_SEQ_GET(eplg);
> +		if (startm != endm)
> +			trace_scmi_tlm_access(0, "MSEQ_MISMATCH", startm, endm);
>  	} while (startm != endm && --retries);
>  
> -	if (startm != endm)
> +	if (startm != endm) {
> +		trace_scmi_tlm_access(0, "TDCF_SCAN_FAIL", startm, endm);
>  		return -EPROTO;
> +	}
>  
>  	return 0;
>  }
> @@ -1923,6 +1943,8 @@ static void scmi_telemetry_scan_update(struct telemetry_info *ti, u64 ts)
>  			tde->last_ts = tstamp;
>  		else
>  			tde->last_ts = 0;
> +
> +		trace_scmi_tlm_collect(ts, tde->de.info->id, tde->last_val, "FC_UPDATE");

tde->last_ts instead of ts?

>  	}
>  }
>  
> @@ -2001,8 +2023,11 @@ static int scmi_telemetry_tdcf_de_parse(struct telemetry_de *tde,
>  		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * 1000);
>  
>  		startm = TDCF_START_SEQ_GET(tdcf);
> -		if (IS_BAD_START_SEQ(startm))
> +		if (IS_BAD_START_SEQ(startm)) {
> +			trace_scmi_tlm_access(tde->de.info->id, "MSEQ_BADSTART",
> +					      startm, 0);
>  			continue;
> +		}
>  
>  		/* Has anything changed at all at the SHMTI level ? */
>  		scoped_guard(mutex, &tde->mtx) {
> @@ -2018,11 +2043,16 @@ static int scmi_telemetry_tdcf_de_parse(struct telemetry_de *tde,
>  		if (DATA_INVALID(payld))
>  			return -EINVAL;
>  
> -		if (IS_BLK_TS(payld))
> +		if (IS_BLK_TS(payld)) {
> +			trace_scmi_tlm_access(tde->de.info->id,
> +					      "BAD_DE_META", 0, 0);
>  			return -EINVAL;
> +		}
>  
> -		if (PAYLD_ID(payld) != tde->de.info->id)
> +		if (PAYLD_ID(payld) != tde->de.info->id) {
> +			trace_scmi_tlm_access(tde->de.info->id, "DE_INVALID", 0, 0);
>  			return -EINVAL;
> +		}
>  
>  		/* Data is always valid since NOT handling BLK TS lines here */
>  		*val = LINE_DATA_GET(&payld->l);
> @@ -2046,10 +2076,16 @@ static int scmi_telemetry_tdcf_de_parse(struct telemetry_de *tde,
>  		}
>  
>  		endm = TDCF_END_SEQ_GET(tde->eplg);
> +		if (startm != endm)
> +			trace_scmi_tlm_access(tde->de.info->id, "MSEQ_MISMATCH",
> +					      startm, endm);
>  	} while (startm != endm && --retries);
>  
> -	if (startm != endm)
> +	if (startm != endm) {
> +		trace_scmi_tlm_access(tde->de.info->id, "TDCF_DE_FAIL",
> +				      startm, endm);
>  		return -EPROTO;
> +	}
>  
>  	guard(mutex)(&tde->mtx);
>  	tde->last_magic = startm;
> @@ -2230,6 +2266,9 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
>  			tde->last_ts = LINE_TSTAMP_GET(&payld->tsl);
>  		else
>  			tde->last_ts = 0;
> +
> +		trace_scmi_tlm_collect(timestamp, tde->de.info->id, tde->last_val,
> +				       "MESSAGE");

tde->last_ts instead of timestamp? If I understand correctly, tde->last_ts
corresponds to the time coming from the platform. We have kernel time anyway
coming from ftrace format.

>  	}
>  }
>  

Thanks,
Elif

