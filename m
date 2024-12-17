Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F82E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 11:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UXKDXVDX1Jr3lbD6ieJ253sAb0OMF93Ugn30UZBS30=; b=TF4WuS63fbDGbFjWfHGIpyT3sx
	m1HyHpsECCTLKo3mxEx+mklMiBdLjLLLmkn17Gb2GaNO0knptVTJE3Rq+HpoIPQ+1G6D306OHWfhK
	BOMguVuNfTvwV4bD6zENFpFGCr3KfbMZn1X0YkcX02dD+jP75ohKV9Z6dxQkcuxU7DIi+sdDIzeFg
	/u7ugPBGVTP9oLSegNpZ0Ejp2W37jRwy6hSbe71Nzwpfrh67qBi3Hssr6vYRsAm3ErVZw8xV99qZd
	mRzpH+/c7Bdh06GkDVcdtSCgVLjOb3ZYGfgAVWyCIUG53ikx0u02tkESoAz6K1FupMUKUQulNLppX
	Md50rU7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVPT-0000000DD9X-0OaJ;
	Tue, 17 Dec 2024 11:06:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVOO-0000000DD2m-2Gfg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 11:05:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH7siLt002322;
	Tue, 17 Dec 2024 11:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/UXKDXVDX1Jr3lbD6ieJ253sAb0OMF93Ugn30UZBS30=; b=ffwprWTe1PhbIQVY
	aac7Asw8SSMcAoJ50ZNq87Am2RwIOru6MR5KIeRT2J/5i90EvuBTocYH1e+ZkoKT
	BYqfha8QQNHYHg0El4TfZ2ySI87izPECWbOjrdhRZ5/wxdSTYWO2ZYBwuZYbzTfS
	cD9yVYi9MZqDATvYqTw9HG14Fzp9usUL+ZoC9RfIV84beL3PovXGkTHVpMhR9GD2
	Sqxxc2hlDuHc6M9wgOaGFF43Wy4MR276ODckrpuqaSn56mM1W/1UwM0ymPqg67u9
	sNdLL7VJsPdsFPGkGHjBAndPO4Unjgs0AxeFMMFY7We9wh0qXMTy5lbCyMEBgcu2
	kK3R3w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k5aw8gn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 11:05:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHB5N0r020092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 11:05:23 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 03:05:17 -0800
Message-ID: <d2d95756-c51d-17bb-ce12-d8ae390a3bac@quicinc.com>
Date: Tue, 17 Dec 2024 16:35:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 4/5] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <myungjoo.ham@samsung.com>, <Kyungmin.park@samsung.com>,
        <cw00.choi@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>,
        <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>, <arm-scmi@vger.kernel.org>,
        Amir Vajid <avajid@quicinc.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-5-quic_sibis@quicinc.com>
 <2aycrvnvivcrqctqmweadcgenwugafdr6ub3bzkscterpenz32@bzabln2hkral>
 <29eef87e-96f6-5105-6f7a-a8e01efcb4a3@quicinc.com>
 <k4lpzxtrq3x6riyv6etxiobn7nbpczf2bp3m4oc752nhjknlit@uo53kbppzim7>
 <ac655bdc-5ccf-c6c6-3203-659f1916c53c@quicinc.com>
 <34p27za5hcpubaxjuddsir2vqnqrvwyesnclu2cocvm3yhbv3r@ak7rcnp67gyd>
 <1f5258f4-7c20-5343-dec6-0847449c821b@quicinc.com>
 <CAA8EJpoN3QSi72UUDV+=YkqySgXkiODUFJvwpBYfSmnkSotuZA@mail.gmail.com>
 <4399f7da-9478-57c0-7405-e51dc35d90ba@quicinc.com>
 <uwwiz2o6brn5zczbpaiajdq7yva2qpcpgzwdr26lhg4jvlwvvj@w5bkiuhdalze>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <uwwiz2o6brn5zczbpaiajdq7yva2qpcpgzwdr26lhg4jvlwvvj@w5bkiuhdalze>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HWL7CnOmVvV-Xc3fGs1jW_pYC-xN7X_w
X-Proofpoint-GUID: HWL7CnOmVvV-Xc3fGs1jW_pYC-xN7X_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_030532_602259_2C0242DA 
X-CRM114-Status: GOOD (  18.93  )
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



On 12/17/24 16:16, Dmitry Baryshkov wrote:
> On Tue, Dec 17, 2024 at 03:46:24PM +0530, Sibi Sankar wrote:
>>
>>
>> On 12/5/24 17:00, Dmitry Baryshkov wrote:
>>> On Thu, 5 Dec 2024 at 12:53, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 11/14/24 18:02, Dmitry Baryshkov wrote:
>>>>> On Thu, Nov 14, 2024 at 09:43:53AM +0530, Sibi Sankar wrote:
>>>>>>
>>>>>>
>>>>>> On 10/26/24 23:46, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Oct 22, 2024 at 01:48:25PM +0530, Sibi Sankar wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 10/7/24 23:27, Dmitry Baryshkov wrote:
>>>>>>>>> On Mon, Oct 07, 2024 at 11:40:22AM GMT, Sibi Sankar wrote:
>>>>>
>>>>>>>>>
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +struct map_param_msg {
>>>>>>>>>> +        u32 hw_type;
>>>>>>>>>> +        u32 mon_idx;
>>>>>>>>>> +        u32 nr_rows;
>>>>>>>>>> +        struct map_table tbl[MAX_MAP_ENTRIES];
>>>>>>>>>> +} __packed;
>>>>>>>>>> +
>>>>>>>>>> +struct node_msg {
>>>>>>>>>> +        u32 cpumask;
>>>>>>>>>> +        u32 hw_type;
>>>>>>>>>> +        u32 mon_type;
>>>>>>>>>> +        u32 mon_idx;
>>>>>>>>>> +        char mon_name[MAX_NAME_LEN];
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +struct scalar_param_msg {
>>>>>>>>>> +        u32 hw_type;
>>>>>>>>>> +        u32 mon_idx;
>>>>>>>>>> +        u32 val;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +enum common_ev_idx {
>>>>>>>>>> +        INST_IDX,
>>>>>>>>>> +        CYC_IDX,
>>>>>>>>>> +        CONST_CYC_IDX,
>>>>>>>>>> +        FE_STALL_IDX,
>>>>>>>>>> +        BE_STALL_IDX,
>>>>>>>>>> +        NUM_COMMON_EVS
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +enum grp_ev_idx {
>>>>>>>>>> +        MISS_IDX,
>>>>>>>>>> +        WB_IDX,
>>>>>>>>>> +        ACC_IDX,
>>>>>>>>>> +        NUM_GRP_EVS
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +#define EV_CPU_CYCLES           0
>>>>>>>>>> +#define EV_INST_RETIRED         2
>>>>>>>>>> +#define EV_L2_D_RFILL           5
>>>>>>>>>> +
>>>>>>>>>> +struct ev_map_msg {
>>>>>>>>>> +        u32 num_evs;
>>>>>>>>>> +        u32 hw_type;
>>>>>>>>>> +        u32 cid[NUM_COMMON_EVS];
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +struct cpufreq_memfreq_map {
>>>>>>>>>> +        unsigned int cpufreq_mhz;
>>>>>>>>>> +        unsigned int memfreq_khz;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +struct scmi_monitor_info {
>>>>>>>>>> +        struct cpufreq_memfreq_map *freq_map;
>>>>>>>>>> +        char mon_name[MAX_NAME_LEN];
>>>>>>>>>> +        u32 mon_idx;
>>>>>>>>>> +        u32 mon_type;
>>>>>>>>>> +        u32 ipm_ceil;
>>>>>>>>>> +        u32 mask;
>>>>>>>>>> +        u32 freq_map_len;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +struct scmi_memory_info {
>>>>>>>>>> +        struct scmi_monitor_info *monitor[MAX_MONITOR_CNT];
>>>>>>>>>> +        u32 hw_type;
>>>>>>>>>> +        int monitor_cnt;
>>>>>>>>>> +        u32 min_freq;
>>>>>>>>>> +        u32 max_freq;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +struct scmi_memlat_info {
>>>>>>>>>> +        struct scmi_protocol_handle *ph;
>>>>>>>>>> +        const struct qcom_generic_ext_ops *ops;
>>>>>>>>>> +        struct scmi_memory_info *memory[MAX_MEMORY_TYPES];
>>>>>>>>>> +        u32 cluster_info[NR_CPUS];
>>>>>>>>>> +        int memory_cnt;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +static int populate_cluster_info(u32 *cluster_info)
>>>>>>>>>> +{
>>>>>>>>>> +        char name[MAX_NAME_LEN];
>>>>>>>>>> +        int i = 0;
>>>>>>>>>> +
>>>>>>>>>> +        struct device_node *cn __free(device_node) = of_find_node_by_path("/cpus");
>>>>>>>>>> +        if (!cn)
>>>>>>>>>> +                return -ENODEV;
>>>>>>>>>> +
>>>>>>>>>> +        struct device_node *map __free(device_node) = of_get_child_by_name(cn, "cpu-map");
>>>>>>>>>> +        if (!map)
>>>>>>>>>> +                return -ENODEV;
>>>>>>>>>> +
>>>>>>>>>> +        do {
>>>>>>>>>> +                snprintf(name, sizeof(name), "cluster%d", i);
>>>>>>>>>> +                struct device_node *c __free(device_node) = of_get_child_by_name(map, name);
>>>>>>>>>> +                if (!c)
>>>>>>>>>> +                        break;
>>>>>>>>>> +
>>>>>>>>>> +                *(cluster_info + i) = of_get_child_count(c);
>>>>>>>>>> +                i++;
>>>>>>>>>> +        } while (1);
>>>>>>>>>
>>>>>>>>> Can you use existing API from drivers/base/arch_topology.c? If not, can
>>>>>>>>> it be extended to support your usecase?
>>>>>>>>
>>>>>>>> ack. But I'm pretty sure it's going to take a while for reaching such
>>>>>>>> an agreement so I'll drop this feature during the next re-spin.
>>>>>>>
>>>>>>> Why? What kind of API do you actually need? The arch_topology.c simply
>>>>>>> exports a table of struct cpu_topology. Is it somehow different from
>>>>>>> what you are parsing manually?
>>>>>>
>>>>>> yup, we had to figure out the physical id of the cpu
>>>>>> since cpus can be disabled by the bootloader using
>>>>>> status = "failed" property and we have to pass this
>>>>>> onto the cpucp memlat algorithm.
>>>>>
>>>>> Isn't it equal to the index in the cpu_topology table?
>>>>
>>>> from what I see cpu_topology indexes remain unpopulated
>>>> for cpus that are disabled since get_cpu_for_node
>>>> ignores those?
>>>
>>> Why do you need cpu_topology for disabled aka non-existing CPU devices?
>>
>> sorry was out sick couldn't back earlier. We need the know
>> what cpus are disbled to pass on the correct mask of cpus
>> enabled to the SCP.
> 
> Yes. So isn't it enough to know only the enabled CPUs?

yes just knowing the physical index of the enabled cpus
should be enough.

> 
> 

