Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C35C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70q+HSc11xkb37dYPsD5fF+i/atj7mFQY+9yantwPYw=; b=NZz2dg8Q9zxNqKEwfY2otGi68/
	Sm2qVpDPB/cWRLKCZwDpgWoQgT8v7tRV3aH2knC1RdUFmlgXaJ3t5lyzoRjbyf+rDGFdfegJZ4lbA
	PppLV94X3NunxBe8QAoWEhklyPLjyl9NahO1krT507QOQElWeq4a9R1BCH5NGt08GBdDIdXFFvJbj
	SSelDUSs7TNAwD9WxtVgjFjPYS0Yhi10xdcAsO1xfudJjHggrtJegT8KCQWIWc+2V5RxnRJ0zNf5x
	6O9IuAaDq5tK83+8MizG/uMMKlOoyiwWIjaNn4m9b1+eEY0kjjDjsOVwGMic3j6q6si0o11IywBzA
	XoMeDGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVaV-0000000A4yh-2PtO;
	Tue, 18 Feb 2025 21:57:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVF1-0000000A1EV-2k0T
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 18 Feb 2025 21:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=70q+HSc11xkb37dYPsD5fF+i/atj7mFQY+9yantwPYw=; b=DGPoPkMLxr/9AUIeY3q1W2okM4
	Kpf6FegWqLoevrWr4Rg1pkfNqkbsv4PEVWUKYqjzXY1xbcuX2rROE8gB3mhYdKPgPeSRd7PktDnqf
	xoemQMkFdW5Mb9CZD1zb1+RXu2qaccNV+5mmLMqyL5Qaoc2DTAqLkOD0NHaMxpRd4tbCKS7Qzboz8
	kgaX9/ASxz+o/L4mgkisTPNC+a46/X5u4tJuel5SvJAPkRQJPOoZbq8UUkHgPSm+TICs/nNkOy5p3
	nuzNvaXr9p1afPUpxC/cvm+d9mUXS6uNzCqYtlLEbBw8T1jKSSrdP/vWRp7cL2HfbZGACV2sRERdv
	YmohQT2w==;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVEV-000000023hw-3h1n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 21:34:33 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ILMbiM001256;
	Tue, 18 Feb 2025 21:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=70q+HSc11xkb37dYPsD5fF+i/atj7mFQY+9yantwPYw=; b=
	ogn3qEu4ngO6qFWr3Tw3j8MsD1jlGAqHnHyMHGxGDGetmzp9j19aqtQADriOlrJj
	3GF4O1/JEJGAH3RVjXTEG/Rtw4FeZgGwEiVAe3DZ4WroRDctrpgEHYIXRgMPR5hs
	ETzcvlVfrPOnLkpqM+WI8v+vwRw7K2F7+9X4J+++UzAKGajsguIfCJ6x9nanPo0D
	+c2G83GtkQln/EQOUtFzsgDP9m3xR8zKOU1gaBksJ3Q2oZBpDaMyIO6wb9IyzGpl
	OM8AeX8u2+OndmAjNY6wyRkG3kyvKO9gDpBxVCsQU8+6IclE9Y1iSMw4WXX2v6k9
	ibrLa7HAvYyjAuSP/N9fuQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44w00ngagy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 21:33:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51IJt674026248;
	Tue, 18 Feb 2025 21:33:50 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44w0sn3kpd-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 21:33:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qrsas/xjiBu1YjdrVtzl9BUj7uoLm+89HOvSlWwYE6qgxooWI5Dg9v7WPNctrr2EiscrrZ0Te0gP/Hxzo6y2HU8qMq+ueq5zCMDywJB1CA93JeNmYv2e8hY+cr6lSy8cMJdb+hos4VPfonXiQSivssTxoJD8cj2iQs5iKpx0zUgObcPC+giq5B+5ldL86XnHNVg4BJrkGz+RMvUnTyAwRe9k9Axb3js25EJQeHg7sYmkGqXKlaKY7sKOIlMuXXmKK33sa0kokXRB1vpzuUvy5UmzBXDgKznk5kv/uYCWlhUpgWyWe0/5PPnB7KTRgFn809wma0rwu19c1Oi2brVeZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70q+HSc11xkb37dYPsD5fF+i/atj7mFQY+9yantwPYw=;
 b=k6mQURWqoxnkhp8ckgokEtiFSv4YXc9V8BWwdQEWeg6uyB0h/dmoqz+AvOcYNrgl/rP4srwHvLKlJUmisfG/HP/4qxDji5FvwHmRkBAbMnkrY+xEz4LAIDCZnm2ub29NZ1A9SFAxHgKn0jC79VU9tYXotHfBBJdE+iZpBTUtSZjn+41st3Hkd4nonBfQs/5VQkCSI/2sK471DN/28QkCPVGVChBzKtbZG7YRykWl1C305gcVEPU/U/rEJSbcdcPAdS/HHx2VXfDhtgc64zQiJhNH06aEgfw8HrEM5XsoaHYv/nS/ZuGUpDEX3YFRr3rnHV4wGLpNSSz2OVWxRGZ0pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70q+HSc11xkb37dYPsD5fF+i/atj7mFQY+9yantwPYw=;
 b=i5kSgB1qDMwW4tERVmXg1j7yDEarXkd+jEV3YuTbaj1xEkpeTAzeEr8MoH2A7duLC9ROMrhl+AFce2sloHb5BMXO2IJHIN+EaLG0fK/bpWD/PFaPdac2RY+zBNnWtjfgyw8hREpIARYkNseApB15mscsu3BTA7GOVLAJwKz+XcA=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by IA0PR10MB7275.namprd10.prod.outlook.com (2603:10b6:208:3de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Tue, 18 Feb
 2025 21:33:47 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%2]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 21:33:47 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-pm@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, x86@kernel.org,
        pbonzini@redhat.com, vkuznets@redhat.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, peterz@infradead.org, arnd@arndb.de,
        lenb@kernel.org, mark.rutland@arm.com, harisokn@amazon.com,
        mtosatti@redhat.com, sudeep.holla@arm.com, cl@gentwo.org,
        maz@kernel.org, misono.tomohiro@fujitsu.com, maobibo@loongson.cn,
        zhenglifeng1@huawei.com, joao.m.martins@oracle.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: [PATCH v10 05/11] arm64: add support for poll_idle()
Date: Tue, 18 Feb 2025 13:33:31 -0800
Message-Id: <20250218213337.377987-6-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250218213337.377987-1-ankur.a.arora@oracle.com>
References: <20250218213337.377987-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:303:8f::17) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|IA0PR10MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: cd391bfc-d7a8-46e5-d39e-08dd5063ed6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7O6VAIEmSiM+TMwPNrY/fzUJNMDt8Dy1rHa8o5BFCnahdO7vOfo1fu/vGwm0?=
 =?us-ascii?Q?Ylqs+KKXfXAcokA+vQQ8oSHB/VhMUkLLu6uLH5OMfEOLZQIh+OjJjQmJOb2a?=
 =?us-ascii?Q?7DtbToLyQRypiszY5GkpY4wx2NeU/UDHmpfti9DAFcyolZvOhs9OI3etjaCL?=
 =?us-ascii?Q?hgR26+d/5K4iS4EWUf8cZHtY3dLdJ9A33MtQO1jpq+CWiVO9nahboVhOuCu/?=
 =?us-ascii?Q?8MDXeoigZHJWkyjlmBn7nJ39lPapGf6XRuuHO9E/yYMIfh3N8N4dHRWAG3C4?=
 =?us-ascii?Q?pfBYSTahCSolOQGwJc+WIVnB+Xoti5pSVjGr2RIjaA2qrIa8HKEtUtU0UyxF?=
 =?us-ascii?Q?SgezUC+9AEY/hdotranZOAqgp9RJkpb6d3/llUgYumLdTXRtMdE8mMlxphlp?=
 =?us-ascii?Q?BDEdZLh0VI6IGDqZ0RazozJzb43kpd6S3+v2KqmeiXC+fVg4VkJV6TLABBaB?=
 =?us-ascii?Q?iC6EYa6D8tI1bU5QFqB2YdwCWWMWHVIYDhGoJpisNBbrrvA6kCvjknlysAIa?=
 =?us-ascii?Q?US6YUPcH8Kj/Ut2I71udmmruOORR8+2tCmI4r2x6oGunTwYpx5DIo5hluL0Q?=
 =?us-ascii?Q?jlwdVNf+y0mTQO4sNDcRzoX/lL6muEQ1/6vWM0QgXvBFCIbfzgRhUkkHydeC?=
 =?us-ascii?Q?WsVaxEE3ENABtLohUWjrgAngu6s/lLgwVw1BGZNsMRTe3X8r/7dOntZef/Mx?=
 =?us-ascii?Q?/guZqFO9Ymi66NJ89A/g+Sk1GEIvdnL918kVokcC3k1Vvvx+9qHLIQdIcNSl?=
 =?us-ascii?Q?cWt1laOTarlief06seRxOIGEjijfxv8fb1Zd8vlhnLIGhyjW7WJkdviOu7o/?=
 =?us-ascii?Q?90tXJeaW4SyBO7pTB1a592hRaoBJ0VqH4bDx5O2R8BZiqPrKsR18OQnIGs7K?=
 =?us-ascii?Q?4SZhmL3sWu0lc0JyA+NZfTlR+WlwjHcBWknSbUu+pYbHhyE3/6a93KqqgK+8?=
 =?us-ascii?Q?fdZVLc0K+ry6BIxhBvbDNFhq7oFczR4l5Gdrcy+OJcEQ/rG02rsT+So0M2Xx?=
 =?us-ascii?Q?eqASWE8UajrC5FCB/7EhrgSBXCyqYOJiciurRdMZwhcIMSQGJWZcFvw4NhWQ?=
 =?us-ascii?Q?wlctoYVBbQxaocTMZD9w02G6vLxMTJ7sq0stOjKFMCaWMULeD8U3r2kuRl8v?=
 =?us-ascii?Q?kkbMMwCWuJUEf9qjxUVoyrr+a4qNIUWSTwLjp3dCzTj5tQ5xJ11hJLXhxeh1?=
 =?us-ascii?Q?API3vlWI0MXiftqNZO2rNsST1P40cf3U0NRZXwgSxebq+u2xIgwjLSQcmlIU?=
 =?us-ascii?Q?YueNba/d1XNprMIjV8BUZY4mDrZhe6BteY0f5kH3/nIxhm6oBZgqVCJFNQey?=
 =?us-ascii?Q?aqnNVQ+394XC/W0actf6f95/vuiRekp65yEGxmVgfVruLQbYTCYX+7A7KUm3?=
 =?us-ascii?Q?R04YcbZ5oVmcXeIhopZ/5rWc6qe4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9wfkEkvoitqKJZek2CjFD/2eRQVKEeVkH2+GXzV8Ihoy3DWMWiywqKzFpxDO?=
 =?us-ascii?Q?YcERPdopCxKpiVpLAnkc68SkbkCryNJZH9rqd3CEPlh+fFj9+KOzg4jzHOl5?=
 =?us-ascii?Q?4zrHpwHJUD9StvzOTspTL4ImIecGoDQqkLvRVbGUj05WJmNKVZjepuHYbYxJ?=
 =?us-ascii?Q?fdRa7dXWf4/noTg/HKkI1Gmf+EUAzr5C9aFOgPPZTaWwgHPZmXVCXvy5XKVb?=
 =?us-ascii?Q?YDXa7HWhho8DDJJglnk6F5BRdLd8+vh854hsWZHiHv8/wjySied7JdaxZ4ZK?=
 =?us-ascii?Q?YsJtoXwUM6QOYyfLd9WvXb3Qef7O4YyYsmW5cD8tRvA6lbxloVv+FQvOK0au?=
 =?us-ascii?Q?55Z49kpk808nln7iXBZKp+3YomIx6Jk3d0oIAeLbAEzKC68R0gzHlIseS+kL?=
 =?us-ascii?Q?vslAgSV35Mdyn9SU5q+43qvk6L9V95s7fLNBTZaoiIaczzuIXRvn94yNKrv5?=
 =?us-ascii?Q?An+WC1pt+UPILeGSmxAURkJyd3gJ9qhder5cc1WqOLB18AZpbC3PZz+Hggw8?=
 =?us-ascii?Q?GSNKzy3yfvnXVnFZOJQE0UhOuM4PcO5g6r7lSQNKHiYy6Aoc3700u6qHuHLh?=
 =?us-ascii?Q?MFPT+3pI+c19ow6j5OGo2/euQyL6lGA1FtdQSivjF+pCg2sD+4j6KRnBV26y?=
 =?us-ascii?Q?UgvSwKUyYjP/UBb0M+Sw/l7eQbnN1johr1f92uOrS+Lz/a3XwsNjFp6SoraZ?=
 =?us-ascii?Q?SGmAZgB7JF8w4UB8aDqr+6TZRYYf2MDrvUZNUHSUpYmaN+4hN2JoAUiTzf4S?=
 =?us-ascii?Q?GcJ6sYsLrxhm0zR/q3jbrSIEp8ZvLaUjGakwaJeFv0M+/h5+yG3eJ6+Q4tAk?=
 =?us-ascii?Q?q3pLFqFymZaV8WeePdUZOFJ/LxglMYzTjNZ6HwF/95HKCukOg3fYgLqyFIjA?=
 =?us-ascii?Q?CaRl4BV/Eg11y+VI95SgPrPLrH56s0cHhKGNCyCxs2zZRPDIXe3OVOtvNbh1?=
 =?us-ascii?Q?1e9fawwYVRGy7959F6o+2qqB1SEkyzq38nREHdFcBMPMiYORFlpLK0vhB8Ba?=
 =?us-ascii?Q?wxeMwXCWVaIWxH+L8fML2AXh599DmuMTlelri5HhHxuizjWtqVhfvBsr8oE4?=
 =?us-ascii?Q?YrIJZHF0nIo72PizDHQgGAxPc0VmvyPexftSB69lCSqmCuQvoggbxCzQevbz?=
 =?us-ascii?Q?RsfWgQ3Vl8hZhHU28LdisNKuIHlH4MqgltPF2b/IuZC6IM9p0Ik9u1ZGmMAl?=
 =?us-ascii?Q?FbDkvb7hOs1w/yYmp3pcAN2GQ3UT5nC2UJuNtxNAs7wJEzbyR9rFnd3Mb/ig?=
 =?us-ascii?Q?0a+4npCeJbsldHPZKwVkZDLkY5E+weqb9UE2Bncy+3ylDIBjsIZNRejdSE35?=
 =?us-ascii?Q?AqilIPxnek5FFLKtNeYhTF2RIAR4WxtsZba6wumS6a7NHecvnofZ08pceGY5?=
 =?us-ascii?Q?g9Q36WL1SCrp/nhGidbo4Q5IX4B4zZEwUdxAQAB0PqXMuMBv/B9+qVLLz3fP?=
 =?us-ascii?Q?uF2bKqqt5PMwLLew5kE8z7HVLKc86ArAJFvum5qqYEkeMhtdX29Gswpi9fCQ?=
 =?us-ascii?Q?zgxrlKtLA8nEOkjKQUCa4l3XsWRM+r9cVliVSOFJJcEgDCqVdWu5iruzV+sN?=
 =?us-ascii?Q?8+zUlfjUam1JGEV5CxuhFusLoTWJs6Chg+PCt8CWqguP0v0OED8LzhTk0uTx?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +9J8C3muTRaVnmqb4Le0XNf/kqVHW82o6kAeIykslrihztbaoDbaXiTA9VYkd8fVJiehaQ4/Y5a+q/SFXFaI1fssk1E/pkQ8n1LPZmSRYRlsOELGKvnVBnq5B81H8v7+krDR5obqORO9C2fuw0jLYYpGwGrWjcses9/6ONlwIwVXfGemljkf2kkISyII3pONQ2Feuajsp+p5QGUyjGrX9bWPYZy9XUKE81ZtIjPcY4ZXX3Kk8snUxAdcHSiBVHVIMWGaj/7Gxp1i2HRC8zNenSpDP6YCKuksFPQHoHcyRWUmXdxqbwQCExbu27zcpicl0u/1+s1tENIKI+74AeCH/LQo/4bSnExH7BBxl3oEH7HEJdGw0uIQlx7DD2KLMX2AVLWc2WE0TCUlU8Gt6VYL8RyUeayLTbC3CEs2ySEZTH76NrDlzTV0rqWYs7SQ1ktCuMtSAW0BsGUGA2X/fkj4HTlQtkfkPtdTU2+QnB+wJVsl2VxBlMz5QS1LdcyKkzCf6HUd+aZ65dDMTi7v6m0hSRdQDZOaVffIDMESLmKOHpucXQAWq0PqlX8LU0ICOSEHsZAerfPUcJtN14G7YT3QiamK8bPqwtkFS2Kvp2kvfsA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd391bfc-d7a8-46e5-d39e-08dd5063ed6e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 21:33:47.3188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRhabR+TvMdaIDCuk7JCzqB7MeKJNZ6Iw4RJk+VzFWaiDmMHRjsI0IWDN225xNzybMUHvij8H7h8Isr+nsnm/i8sFPeO35C+CpyCG1FmhVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7275
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_10,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502180140
X-Proofpoint-GUID: l3c3BcIEm5XXL_SreFDQDiiVVzOYoRsa
X-Proofpoint-ORIG-GUID: l3c3BcIEm5XXL_SreFDQDiiVVzOYoRsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_213425_087557_030C0CFD 
X-CRM114-Status: GOOD (  12.07  )
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

Polling in idle helps reduce the cost of remote wakeups: if the target
sets TIF_POLLING_NRFLAG (as it does while polling in idle), the scheduler
can do remote wakeups just by setting the TIF_NEED_RESCHED.

This contrasts with sending an IPI, and incurring the cost of handling
the cost of the interrupt on the receiver.

Enabling poll_idle() needs a cheap mechanism to do the actual polling
(via smp_cond_load_relaxed_timewait()) and TIF_POLLING_NRFLAG support.

arm64 has both of these. So, select ARCH_HAS_OPTIMIZED_POLL.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 100570a048c5..d96a6c6d8894 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -39,6 +39,7 @@ config ARM64
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_NONLEAF_PMD_YOUNG if ARM64_HAFT
+	select ARCH_HAS_OPTIMIZED_POLL
 	select ARCH_HAS_PTE_DEVMAP
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_HW_PTE_YOUNG
-- 
2.43.5


