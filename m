Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72267606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bw+HHlKZ;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.a=rsa-sha256 header.s=selector1 header.b=HD4Zn8as
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3z210TUr+ZyFDmU/8r2EIfo2B3cyQL3SbKT2qt+Pjz8=; b=bw+HHlKZ6HjazYyoZcWQ/JTiqs
	cXVv/blvdAjiiU2HZv4Qz5EkTZzs/1bdHoS+ZrWluXl8azBmSwAIbH3t3/De8msP+/EwV1vgQY1Rb
	Zd7DApPZu0ApqGoXuMSWBByh9QFWaucTGA87nnt16AiboM4KtOLuIGmgcp4lhT91m+bjdQQsyAchl
	UKzAlq2txO03aULKouWCHIsQTgOxTlrmhnGgFwAMzxEbv5wor3NyOyYO8VMx+N65cTSQx1M9y/f4j
	TUBAE/nIS5VIX10uMbJLCfEeutw0ZRcYD4S+Egm5m3y7ajyV65jFtbbvRlWyLaxGjgmgpspVsi3l6
	JuOJ7JWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFrz-0000000BeVv-1FjT;
	Fri, 06 Nov 2026 09:04:23 +0000
Received: from mail-francecentralazolkn190130003.outbound.protection.outlook.com ([2a01:111:f403:d20a::3] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFrw-0000000BeVU-1WwF;
	Fri, 06 Nov 2026 09:04:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buR/o/Rp/K1B80n2vckWnQaL2qg73rmFEJgQo52UuImG6vGcdvNn1YxPYRsT6YZQg4vvbUl79mnF1H97qbgb9DRqPBMP7ug71+sZJbF8R11ZA8iMv7g1X9xNBuT6bSyUijZrS0Upg/Fqr3bm2CI8DaEbVfUqHoVPMXFzEG7mNWIdOfnnQU3ZsNvGRORhU6gTfsUH+heaV8Ha8eCn09JEB/dcPwOFzv+W6KyUFf0cA7Og1XpJMSX97SnH/5J7cqkFl7cNuSIrojPpuaxhu/gVPBZsSMllN4dpQ6F1UXl67TnoQywrgKyLdqme8risDaMrFDfHPjzn5ZtnJ8TriiXQxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3z210TUr+ZyFDmU/8r2EIfo2B3cyQL3SbKT2qt+Pjz8=;
 b=xp7zRyv2R14m3Rbj/tatH7EGsTiosUdpabSBAr4K3LM+V8pQip7YUS0E3Jh2c5BqqXpbGJUkXTKF7rhKPFoQkzTtf4R0UD7y820Bkgm5um9YzPOcI7bPb+RAWlPWs57E9+AlIQRz49yl8bMnc8I2UwAIt7Stq30qmEJwGSmZcByS2prPt+mRDgrdepjvJUBHOocqeWNPBQNizSezNnteNk5gkjTW+MBVJKWaUh4k26urm/MblGDxDLOPYP6MJUt00I0lmp6gV/Fdg2dF2OjhHuhgzRed1siAqAdtORMQD1GiKIUu1H90lteO8eDWwLgkh+2srscNZHxYOD6iOAYHCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3z210TUr+ZyFDmU/8r2EIfo2B3cyQL3SbKT2qt+Pjz8=;
 b=HD4Zn8asbqzOT5J1fSbvnlghG/muxOSWuQuTO7Q7S1UPDEkQReO5T5k8nYeQGr2xmlbwj74A1xzjtsH/ahBaGPceHC8KGmV75VpL7q24tqnOOOdLqB/F8wEKO2YJnZXF+4JCh/KbpeeJ6We8z49UtHYgiHxgIg/zS43BpF8baItu+nJV4f4cpCfj427+ZoMMCoig+LW/r90HDq2qu0qSEqsFz0W/JrtWpL/lJeqwGcU2gc8DsZBaP/nwZ2mO/oovuOvPLjY6IDLp9cmWANAxKa+dfo0hlRaSyWRU5qtm3OEDKCbow7Yu3BDAiW/67ZdX708BFY5Ctg9w6o1IHCxVwg==
Received: from MMZPR08MB549315.eurprd08.prod.outlook.com
 (2603:10a6:190:28::19) by DU0PR08MB9775.eurprd08.prod.outlook.com
 (2603:10a6:10:444::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 09:04:15 +0000
Received: from MMZPR08MB549315.eurprd08.prod.outlook.com
 ([fe80::21ab:3314:172:c7e5]) by MMZPR08MB549315.eurprd08.prod.outlook.com
 ([fe80::21ab:3314:172:c7e5%5]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 09:04:15 +0000
Message-ID: <MMZPR08MB549315E847B5E8AD50B86B6F61DF762@MMZPR08MB549315.eurprd08.prod.outlook.com>
Date: Fri, 6 Nov 2026 10:04:12 +0100
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Christain_Stefan_K=C3=B6ver-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH v7 1/7] dt-bindings: clock: meson: Add audio power domain
 for S4 soc
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
 bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, perex@perex.cz,
 tiwai@suse.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jiebing Chen <jiebing.chen@amlogic.com>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192404.209695-2-christian.koever-draxl@student.uibk.ac.at>
 <20261027-aloof-lush-hog-c7beeb@quoll>
Content-Language: en-US
In-Reply-To: <20261027-aloof-lush-hog-c7beeb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0086.eurprd04.prod.outlook.com
 (2603:10a6:803:64::21) To MMZPR08MB549315.eurprd08.prod.outlook.com
 (2603:10a6:190:28::19)
X-Microsoft-Original-Message-ID: <0e5253d2-cb0e-44c9-ada1-4243a9e3e885@outlook.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MMZPR08MB549315:EE_|DU0PR08MB9775:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b9e3ad0-a19b-4bab-875d-08df3be4ee83
X-Microsoft-Antispam: BCL:0;ARA:14566002|25010399006|4140399003|19110799012|8060799015|15080799012|5072599009|6090799003|23021999003|19101099003|51005399006|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajR2WnJaTjFZaVBvK2tZTy9sSitLNWlVRzZnZWFSQ09DWkFGNzZ4VCtwbE1F?=
 =?utf-8?B?M2hBS3Znbjlqc2czWDgyOEViYW51R0hmU2Fpd0I4UkZMb2pBSGg4czc1VjhQ?=
 =?utf-8?B?dkVLYk1taWtxc0l3QmpmdzRIZE0vUVlQRngvMi82WGFyVDBJKzFTR29DS090?=
 =?utf-8?B?aDNueDFwRzhyL3JQQ0Z1V2lud25vTkFhbldTWDV0azlqYTFDUXRSQ01PUzNL?=
 =?utf-8?B?Z3ZJSVpUdlh2K1h6MlRJcHJyWVRwNGpBYWp0eXVZcHEyeHdSR01JZEdoRFRo?=
 =?utf-8?B?Mm9Vd3dxZDZIeUx1bk5IWDdsT0RSL1BNV1g3ZjAzRjhvQm9WR3NrY3VnS0lH?=
 =?utf-8?B?eVpHSFdoU3hwTlBsTGR2bnQ4VmhpN2ZPSUwvZE1mdjhXb1pzTzIrenBzVFZR?=
 =?utf-8?B?YlJQY3dWd0xPSjlpT2lWc2JQNGNzWW9BZnpyREE5eFlEZk1Fa09kSkp1TlRp?=
 =?utf-8?B?NEtJcmVtRmNrSGFqbjlnNTZjd054d1o3VVJjQXJwaWJqdWxEVFVaNlZSWGNY?=
 =?utf-8?B?N29Vb2hvbHkzTGlXTlV6UjUxdld4Ry9MZ0E0ZXRpSzNwV0kraldlRkhiMThw?=
 =?utf-8?B?d1JPcUxYZ0I5WEx1elBZWjlpUGQ4VzVOUS9MZUJjbU5MUXVmejBrRER3VVEx?=
 =?utf-8?B?MnkwZXQ4VG9PR0thUUM0Rm54WFZmTEthNkNpZFJNT0hrejRxUFRTeFBDTmZY?=
 =?utf-8?B?bUtFdmpXak90QjdiSHlJbXRKZzNJRUZSSFdSK1pGNi9XSHVZWXljS3R5Ulpp?=
 =?utf-8?B?T1VzbENkdnlZL1A5eU44WVNVQzdQOGR0a3E0MDRhZlpyQUxpSjNGK0lFa0pG?=
 =?utf-8?B?dkJxaGV3U1BRajcyci9hbnUzUFAwZUZmVGJ4VjFQYnhnZDBON08wTU1XQTNy?=
 =?utf-8?B?N1FXRzkyQStlYXRKTlA2UlNvQ3B2ditDdmp1Q1l1Q09uNklRV3B1YVFkMXMr?=
 =?utf-8?B?TjhZcGErbDd6d3lva2VZR296c0ZSMWhyYXpWMlBMdjd0TVhycGIrajk5Q3lx?=
 =?utf-8?B?NC9nUzRyMmFRclc1aVlKYzRWZm9NMjl3WWY2YmxwUGJLWFJMRnJLZEhTMk1J?=
 =?utf-8?B?RjFQQ0t6K3A5T0JZRlFWOGZ2TXhyRTFKdVBwUXFXOW5PeUxpRnlBYTJOcHNY?=
 =?utf-8?B?dnJ3OGhhYkd1UmdhcTRwM2UwSmduMEwrQWVvc2xTZ3hLaDJ6QVl4eGxqNVhS?=
 =?utf-8?B?NDVERHpXL3lHY2tsRXZSNytqMmRCVTVYZ01KMDZ2dmtKOVBTV1ZhTjIvZDlM?=
 =?utf-8?B?SHlLZjh2V3FheE5TcXdpNVBxbU9KT0xybFNLdTJEMENwMm9sUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlhscHRQSngvKy94L0g0TG16NFg5bmRWRWlHWHZQTU1STDdDVjI2VFEyaTdU?=
 =?utf-8?B?QjJ6ZVlyNUlOa3J3bzdTdytoN0dwMHZJK2lYaHhoQ0FyVmhvUVFCQVBycFZr?=
 =?utf-8?B?bUFWcWdmZWkwWFhkS2M3cDh1b2krQ0g1dmJ4MG1kbUdkRDVGQ3EwTHV6MCtR?=
 =?utf-8?B?ci9YOTMrQnFxTXdpYW9iOGQ2ZlZYeVZPR2hDeEtiUmEwWEJXUEhuZzhZbTRK?=
 =?utf-8?B?WGVpa0ZTQXdsN0NKT3pvVDI0aXQ5Q1BTb0pDWDhHTDBaTHV1eE5OS2ZmaHho?=
 =?utf-8?B?YndsOC85WUROdmJzMTJvMy9ES0EzOEx2eHdpNEJ0bG5DVXlxZms0WmJKVWdw?=
 =?utf-8?B?NmhBakNKbWpoLzFWTTd1elU1SGxoSEZTUlRoNVplaGJ1a1Vmb3BiNnczWnNZ?=
 =?utf-8?B?NHh2ekZqWk1aeVZRYlN0M0x2R0dEN1FsUFd5QkFBbVhlRmg4aEVDT0s0Tkha?=
 =?utf-8?B?T2V0MUZvVzZ3Q3MxSjVkK0NlbkUwb2VrcW9CS3FmT0ROc3dUVVZ6TVdlMWp1?=
 =?utf-8?B?WW9OYkNCSWR4L3B0cC9HaVU5UElJRXhMUmtzL2E0OGMxdTZxV3hhYThpdlU5?=
 =?utf-8?B?djJZQmdhQWxIUHVxdmxOOXZyU3lpUG4yU3NpNm9YSnRQMzNZUklDU05xcyt0?=
 =?utf-8?B?dXlXOS9rbGtWNU9oR1pDMTdab3FJN0RZMGx6R1RraUZVbWpSTFJsbWdwbWZy?=
 =?utf-8?B?RzUzQlh1dlRTYjBvV0xHMExyUGh0RVBja3A2U2pFbWVZZFljSi94OVdKT0ZM?=
 =?utf-8?B?NkxPYXU5Q0tFekw1YWNaVENzQko3SURncks5TEt6ekZPR05UMzdzQWhpUTJX?=
 =?utf-8?B?VWd6MTJNTzlqSVhrVFQ0eXJkT0RkSVNBQUttRTNWdnBZcHVYTmhpOGtjUnA0?=
 =?utf-8?B?aFJIcEZJMldrTEdwcmpvOG5GSHV3cDcvMXVjZDQ5MGhReG9RSEo1K0FGNHBI?=
 =?utf-8?B?RlhVeEh3bUJ3WnFINFJ2VWRzT3g1VXVCTDhHZ1pPcFViQ3pvN3k3SWhuNDJC?=
 =?utf-8?B?K3dhaE16YVZ3NjBpaHpKQ25CbkUxV2ppSUNDb2M0dG9iU3ZabGszdWMzNG5I?=
 =?utf-8?B?Vmd1YUxTdlR6QURTT0xwUWE2bzh1RDBoTmxJdi9GalB1RkNLb2t1dDNZSk54?=
 =?utf-8?B?d09CQVkrazYxbFdpQk9CNzM3UUdoV2lQN3pjSzNnY01sSHBGcDI4OXpBcnU5?=
 =?utf-8?B?eWhkcmxRd0IydDZpMHZXaHF0VlE0YmNucUp5MHpWbmVOVE9UdVV0U3JTcXkv?=
 =?utf-8?B?OTFtYnRCSDR3d09iRnVYVzdsakFBUVhDTDFqNkZ1Q3IrMDFSdSsyT1V2TkRk?=
 =?utf-8?B?MzEzQzJWNXZqOEpSemJYVi8ya3Z1MmZ4a3NCdndzTG12dzBqT1l1NnR1VDlv?=
 =?utf-8?B?aEh5TmR3eWd0Y0tNaG5hZ01ZQ0MzbklVdFV5Nm9kdlljWWRaR0FlRkY1bU9o?=
 =?utf-8?B?dDROcjN2WlcwNlBiWVV2VW4vN3pnb1Q2Yzlzd0hmY3NSbXcxaW1tUjFNNXht?=
 =?utf-8?B?dW9pQjVJaFNKZ1hSZ0owNVNqYVNoZFFJM2g2VHNXTTh6TlVVMW9HMDVZTmVI?=
 =?utf-8?B?aFBhSzN2YTl6NGJTK0NSeFk2bTlQYkpWVDZyN1RMcU5LSFJtdW5CbmpubTd3?=
 =?utf-8?B?UjJFYm1OQVM5NGJJZmhFTVg2eEVKeDdJSVYxWnVLZW5RdjgrdyswTXR3U0Vw?=
 =?utf-8?B?dTF0SGhKbHg0Z3pveGVxVUs3eFMySU96RGRvc2wvdExHSTZtdTBWQlBCN0ky?=
 =?utf-8?B?VFpEZnlIOWMzTFQ5Y29XcFUvYm9lRGxYQWFERVY1Y1A5Wm1OVGNBeXphWlMx?=
 =?utf-8?B?Tm1iTGpkTHZZeExoOUhDbHFqaEpOUlcyNitYa0ZyWlBNWmYySWF4aWtwckto?=
 =?utf-8?Q?BuXuBtqXuOqKu?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-fbb9b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9e3ad0-a19b-4bab-875d-08df3be4ee83
X-MS-Exchange-CrossTenant-AuthSource: MMZPR08MB549315.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 09:04:15.2675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9775
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_010420_413498_7BDB4BCD 
X-CRM114-Status: UNSURE (   3.96  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/26 10:40, Krzysztof Kozlowski wrote:
> Why removing this blank line?

Hi Krzysztof,

that was a mistake. As Jiebing already sent his own new patch, you can 
safely ignore my posting.

Kind regards,
Christian K.-D.

